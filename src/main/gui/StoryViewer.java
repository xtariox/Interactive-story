package main.gui;

import main.dao.*;
import main.dao.Choice;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * The storyViewer class represents the main GUI for the interactive story application.
 * It extends JFrame and provides a window to display chapters and choices.
 */
public class StoryViewer extends JFrame {
    private JPanel contentPanel, choicePanel;
    private JLabel titleLabel;
    private JScrollPane contentScrollPane;
    private JEditorPane contentArea;

    private ChapterDAO chapterDAO = new ChapterDAO();
    private EndingDAO endingDAO = new EndingDAO();
    private Chapter currentChapter;

    /**
     * Constructs a new storyViewer window.
     */
    public StoryViewer() {
        setTitle("Interactive Story");
        setSize(800, 600);
        setLayout(new BorderLayout());
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Main background color
        getContentPane().setBackground(Color.BLACK);

        // Main content panel
        contentPanel = new JPanel();
        contentPanel.setLayout(new BorderLayout());
        contentPanel.setBackground(Color.BLACK);
        contentPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        add(contentPanel);

        // Chapter Title
        titleLabel = new JLabel("Title", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Monaco", Font.BOLD, 18));
        titleLabel.setForeground(Color.WHITE);
        contentPanel.add(titleLabel, BorderLayout.NORTH);

        // Chapter Content
        contentArea = new JEditorPane();
        contentArea.setEditable(false);
        contentArea.setContentType("text/html");
        contentArea.setBorder(BorderFactory.createEmptyBorder(40, 20, 20, 20));
        contentArea.setBackground(Color.BLACK);
        contentArea.setForeground(Color.WHITE);
        contentArea.setFont(new Font("Monaco", Font.PLAIN, 12));
        contentPanel.add(contentArea, BorderLayout.CENTER);

        // Add a JScrollPane to the contentArea
        contentScrollPane = new JScrollPane(contentArea);
        contentScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        contentPanel.add(contentScrollPane, BorderLayout.CENTER);
        contentScrollPane.setBorder(BorderFactory.createEmptyBorder());

        // Choices Panel with increased height
        choicePanel = new JPanel();
        choicePanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 40));
        choicePanel.setBackground(Color.BLACK);
        choicePanel.setPreferredSize(new Dimension(800, 150));  // Set larger height
        contentPanel.add(choicePanel, BorderLayout.SOUTH);

        // Load the first chapter
        loadChapter(1);
    }


    /**
     * Loads a chapter by its ID and updates the GUI components.
     *
     * @param chapterId the ID of the chapter to load
     */
    public void loadChapter(int chapterId) {
        currentChapter = chapterDAO.get(chapterId);
        if (currentChapter != null) {
            titleLabel.setText(currentChapter.getTitle());
            String content = "<p>" + currentChapter.getContent() + "</p>";
            content = content.replace("\n", "</p><p>");
            // Set color and font for the content
            contentArea.setText("<html><body style='color:white; font-family:Monaco; font-size:12pt'>" + content + "</body></html>");
            updateChoices(currentChapter.getChoices());
        } else {
            showEnding(chapterId);
        }
    }

    /**
     * Updates the choice panel with buttons for the chapter's choices.
     *
     * @param choices the list of choices for the current chapter
     */
    private void updateChoices(java.util.List<Choice> choices) {
        choicePanel.removeAll();

        // Set FlowLayout with center alignment
        choicePanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 20));

        for (Choice choice : choices) {
            // Create a JButton with the choice text
            JButton choiceButton = new JButton(choice.text());
            choiceButton.setFont(new Font("Monaco", Font.BOLD, 12));
            choiceButton.setBackground(Color.BLACK);
            choiceButton.setForeground(Color.WHITE);
            choiceButton.setBorder(BorderFactory.createLineBorder(Color.WHITE, 2));
            choiceButton.setFocusPainted(false);

            // Calculate the preferred width of the button based on the text length
            FontMetrics metrics = choiceButton.getFontMetrics(choiceButton.getFont());
            int textWidth = metrics.stringWidth(choice.text());

            // Set the preferred size based on text length, adding some padding
            int buttonWidth = textWidth + 40; // Adding 40px of padding
            Dimension buttonSize = new Dimension(buttonWidth, 50); // Set the button height to 50px
            choiceButton.setPreferredSize(buttonSize);

            // Add the action listener for the button
            choiceButton.addActionListener(new ChoiceButtonListener(choice));

            // Add the button to the panel
            choicePanel.add(choiceButton);
        }

        // Ensure the choicePanel resizes and displays all buttons
        choicePanel.revalidate();
        choicePanel.repaint();

        // Make sure the main content panel adjusts to accommodate the choicePanel's size
        contentPanel.revalidate();
        contentPanel.repaint();
    }


    /**
     * Displays the ending by its ID.
     *
     * @param endingId the ID of the ending to display
     */
    private void showEnding(int endingId) {
        Ending ending = endingDAO.get(endingId);
        if (ending != null) {
            titleLabel.setText("The End: " + ending.getTitle());
            String content = "<p>" + ending.getContent() + "</p>";
            content = content.replace("\n", "</p><p>");
            // Set color and font for the content
            contentArea.setText("<html><body style='color:white; font-family:Monaco; font-size:12pt'>" + content + "</body></html>");
            choicePanel.removeAll();
        } else {
            titleLabel.setText("Error");
            contentArea.setText("Chapter or Ending not found.");
        }
        choicePanel.revalidate();
        choicePanel.repaint();
    }

    /**
     * The ChoiceButtonListener class handles the action events for choice buttons.
     */
    private class ChoiceButtonListener implements ActionListener {
        private Choice choice;

        /**
         * Constructs a new ChoiceButtonListener.
         *
         * @param choice the choice associated with this listener
         */
        public ChoiceButtonListener(Choice choice) {
            this.choice = choice;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            if (choice.nextChapterId() > 0) {
                loadChapter(choice.nextChapterId());
            } else if (choice.endingId() > 0) {
                showEnding(choice.endingId());
            }
        }
    }

    /**
     * The main method to start the interactive story application.
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            StoryViewer viewer = new StoryViewer();
            viewer.setVisible(true);
        });
    }
}
