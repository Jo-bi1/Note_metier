package com.example.service;

import com.example.dao.*;
import com.example.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NoteService {

    @Autowired
    private NoteDAO noteDAO;

    @Autowired
    private ParametreDAO parametreDAO;

    public Double calculerNoteFinale(Candidat candidat, Matiere matiere) {
        List<Note> notes = noteDAO.findByCandidatAndMatiere(candidat, matiere);
        if (notes.isEmpty()) return 0.0;

        List<Double> valeurs = notes.stream().map(Note::getNote).collect(Collectors.toList());
        
        Optional<Parametre> optParam = parametreDAO.findByMatiere(matiere);
        
        if (optParam.isPresent()) {
            Parametre param = optParam.get();
            double max = Collections.max(valeurs);
            double min = Collections.min(valeurs);
            double diff = max - min; 

          
            boolean conditionMet = false;
            String symboleOperateur = param.getOperateur().getNom(); 
            Double seuil = param.getSeuil();

            switch (symboleOperateur) {
                case "<":  conditionMet = diff < seuil; break;
                case ">":  conditionMet = diff > seuil; break;
                case "<=": conditionMet = diff <= seuil; break;
                case ">=": conditionMet = diff >= seuil; break;
                case "=":  conditionMet = diff == seuil; break;
                default:   conditionMet = false;
            }

           
            if (conditionMet) {
                String nomResolution = param.getResolution().getNom().toLowerCase();
                
                if (nomResolution.contains("plus petit")) {
                    return min;
                } else if (nomResolution.contains("plus grand")) {
                    return max;
                } else if (nomResolution.contains("moyenne")) {
                    return calculMoyenne(valeurs);
                }
            }
        }

        return calculMoyenne(valeurs);
    }

    private Double calculMoyenne(List<Double> valeurs) {
        return valeurs.stream()
                .mapToDouble(Double::doubleValue)
                .average()
                .orElse(0.0);
    }
}
