package virtuallibrary;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;

public class LibraryController {

    @FXML
    private TextField titleField;

    @FXML
    private TextField authorField;

    @FXML
    private TableView<Book> bookTableView;

    @FXML
    private TableColumn<Book, String> titleColumn;

    @FXML
    private TableColumn<Book, String> authorColumn;

    private ObservableList<Book> books = FXCollections.observableArrayList();

    public void initialize() {
        titleColumn.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getTitle()));
        authorColumn.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getAuthor()));
        bookTableView.setItems(books);
    }

    @FXML
    private void addBook() {
        String title = titleField.getText().trim();
        String author = authorField.getText().trim();

        if (!title.isEmpty() && !author.isEmpty()) {
            books.add(new Book(title, author));
            titleField.clear();
            authorField.clear();
        }
    }

    @FXML
    private void deleteSelectedBook() {
        Book selectedBook = bookTableView.getSelectionModel().getSelectedItem();
        if (selectedBook != null) {
            books.remove(selectedBook);
        }
    }
}