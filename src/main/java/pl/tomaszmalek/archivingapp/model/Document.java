package pl.tomaszmalek.archivingapp.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Entity
@Table(name = "documents")
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotBlank(message = "Complete the description")
    private String description;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Complete the document date")
    private LocalDate documentDate;
    @NotBlank(message = "Complete the name of the recipient")
    private String recipient;
    @NotBlank(message = "Complete the name of the sender")
    private String sender;
    @NotBlank(message = "Complete the document sign")
    private String documentSign;
    private String comments;
    @ManyToOne()
    private Case caseSign;
    @OneToOne
    private DBFile dbFile;

    public Document(long id, String description, LocalDate documentDate, String recipient, String sender, String documentSign, String comments, Case documentCase, DBFile dbFile) {
        this.id = id;
        this.description = description;
        this.documentDate = documentDate;
        this.recipient = recipient;
        this.sender = sender;
        this.documentSign = documentSign;
        this.comments = comments;
        this.caseSign = documentCase;
        this.dbFile = dbFile;
    }

    public Document(){

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDocumentDate() {
        return documentDate;
    }

    public void setDocumentDate(LocalDate documentDate) {
        this.documentDate = documentDate;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getDocumentSign() {
        return documentSign;
    }

    public void setDocumentSign(String documentSign) {
        this.documentSign = documentSign;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Case getCaseSign() {
        return caseSign;
    }

    public void setCaseSign(Case documentCase) {
        this.caseSign = documentCase;
    }

    public DBFile getDbFile() {
        return dbFile;
    }

    public void setDbFile(DBFile dbFile) {
        this.dbFile = dbFile;
    }
}
