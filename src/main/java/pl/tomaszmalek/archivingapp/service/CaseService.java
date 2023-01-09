package pl.tomaszmalek.archivingapp.service;

import pl.tomaszmalek.archivingapp.model.Case;

import java.util.List;
import java.util.Optional;

public interface CaseService {
    void save(Case aCase);

    void delete(long id);

    List<Case> getAll();

    Optional<Case> getById(long id);
}
