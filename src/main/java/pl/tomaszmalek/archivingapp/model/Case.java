package pl.tomaszmalek.archivingapp.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "cases")
public class Case {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotBlank(message = "Complete the case sign")
    private String caseSign;
    @NotBlank(message = "Complete the description")
    private String description;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Complete the document date of initiation")
    private LocalDate dateOfInitiation;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Complete the end date")
    private LocalDate endDate;
    private String comments;
    @OneToMany(mappedBy = "caseSign")
    private List<Document> documents;

    public Case(long id, String caseSign, String description, LocalDate dateOfInitiation, LocalDate endDate, String comments, List<Document> documents) {
        this.id = id;
        this.caseSign = caseSign;
        this.description = description;
        this.dateOfInitiation = dateOfInitiation;
        this.endDate = endDate;
        this.comments = comments;
        this.documents = documents;
    }

    public Case() {

    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCaseSign() {
        return caseSign;
    }

    public void setCaseSign(String caseSign) {
        this.caseSign = caseSign;
    }

    public LocalDate getDateOfInitiation() {
        return dateOfInitiation;
    }

    public void setDateOfInitiation(LocalDate dateOfInitiation) {
        this.dateOfInitiation = dateOfInitiation;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }
}
