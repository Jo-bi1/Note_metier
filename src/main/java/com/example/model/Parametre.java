package com.example.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Parametres")
public class Parametre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Matiere matiere;

    @Column(nullable = false)
    private Double seuil;

    @ManyToOne
    @JoinColumn(name = "id_operateur", nullable = false)
    private Operateur operateur;

    @ManyToOne
    @JoinColumn(name = "id_resolution", nullable = false)
    private Resolution resolution;

    public Parametre() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Matiere getMatiere() { return matiere; }
    public void setMatiere(Matiere matiere) { this.matiere = matiere; }
    public Double getSeuil() { return seuil; }
    public void setSeuil(Double seuil) { this.seuil = seuil; }
    public Operateur getOperateur() { return operateur; }
    public void setOperateur(Operateur operateur) { this.operateur = operateur; }
    public Resolution getResolution() { return resolution; }
    public void setResolution(Resolution resolution) { this.resolution = resolution; }
}
