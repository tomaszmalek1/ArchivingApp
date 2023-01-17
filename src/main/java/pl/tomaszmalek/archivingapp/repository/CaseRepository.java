package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.tomaszmalek.archivingapp.model.Case;
@Repository
public interface CaseRepository extends JpaRepository<Case, Long> {

}
