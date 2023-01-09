package pl.tomaszmalek.archivingapp.service;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import pl.tomaszmalek.archivingapp.model.Case;
import pl.tomaszmalek.archivingapp.repository.CaseRepository;

import java.util.List;
import java.util.Optional;

@Service
@Primary
public class JpaCaseService implements CaseService {

    private final CaseRepository caseRepository;

    public JpaCaseService(CaseRepository caseRepository) {
        this.caseRepository = caseRepository;
    }

    @Override
    public void save(Case aCase) {
        caseRepository.save(aCase);
    }

    @Override
    public void delete(long id) {
        caseRepository.deleteById(id);
    }

    @Override
    public List<Case> getAll() {
        return caseRepository.findAll();
    }

    @Override
    public Optional<Case> getById(long id) {
        return caseRepository.findById(id);
    }
}
