package com.felipejansen.jhipster_flyway;

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.core.importer.ClassFileImporter;
import com.tngtech.archunit.core.importer.ImportOption;
import org.junit.jupiter.api.Test;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

class ArchTest {

    @Test
    void servicesAndRepositoriesShouldNotDependOnWebLayer() {

        JavaClasses importedClasses = new ClassFileImporter()
            .withImportOption(ImportOption.Predefined.DO_NOT_INCLUDE_TESTS)
            .importPackages("com.felipejansen.jhipster_flyway");

        noClasses()
            .that()
                .resideInAnyPackage("com.felipejansen.jhipster_flyway.service..")
            .or()
                .resideInAnyPackage("com.felipejansen.jhipster_flyway.repository..")
            .should().dependOnClassesThat()
                .resideInAnyPackage("..com.felipejansen.jhipster_flyway.web..")
        .because("Services and repositories should not depend on web layer")
        .check(importedClasses);
    }
}
