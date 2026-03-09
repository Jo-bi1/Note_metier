package com.example.controller;

import com.example.dao.*;
import com.example.model.Parametre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/parametres")
public class ParametreController {

    @Autowired private ParametreDAO parametreDAO;
    @Autowired private MatiereDAO matiereDAO;
    @Autowired private OperateurDAO operateurDAO;
    @Autowired private ResolutionDAO resolutionDAO;

    @GetMapping
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("admin/parametres/list");
        mav.addObject("parametres", parametreDAO.findAll());
        mav.addObject("titre", "Gestion des Paramètres");
        return mav;
    }

    @GetMapping("/nouveau")
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("admin/parametres/form");
        mav.addObject("parametre", new Parametre());
        mav.addObject("matieres", matiereDAO.findAll());
        mav.addObject("operateurs", operateurDAO.findAll());
        mav.addObject("resolutions", resolutionDAO.findAll());
        mav.addObject("action", "Créer");
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Parametre parametre, RedirectAttributes ra) {
        parametreDAO.save(parametre);
        ra.addFlashAttribute("message", "Paramètre enregistré avec succès");
        return "redirect:/admin/parametres";
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/parametres/form");
        mav.addObject("parametre", parametreDAO.findById(id).orElse(null));
        mav.addObject("matieres", matiereDAO.findAll());
        mav.addObject("operateurs", operateurDAO.findAll());
        mav.addObject("resolutions", resolutionDAO.findAll());
        mav.addObject("action", "Modifier");
        return mav;
    }

    @GetMapping("/supprimer/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        parametreDAO.deleteById(id);
        ra.addFlashAttribute("message", "Paramètre supprimé");
        return "redirect:/admin/parametres";
    }
}
