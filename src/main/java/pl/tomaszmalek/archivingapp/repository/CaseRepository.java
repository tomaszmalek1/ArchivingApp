package pl.tomaszmalek.archivingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.tomaszmalek.archivingapp.model.Case;
@Repository
public interface CaseRepository extends JpaRepository<Case, Long> {
    @Query("select c from Case c where c.caseSign = ?1")
    Case findCaseByCaseSign(String caseSign);

}
