import main.dao.Chapter;
import main.dao.ChapterDAO;

public class Main {
    public static void main(String[] args) {
        // Test the ChapterDAO class
        ChapterDAO chapterDAO = new ChapterDAO();
        Chapter chapter = chapterDAO.get(1);
        System.out.println(chapter.getContent());
        // Print the choices
        chapter.getChoices().forEach(choice -> System.out.println("- " + choice.text()));
    }
}