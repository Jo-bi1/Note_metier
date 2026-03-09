package com.example.controller;

import com.example.dao.ResolutionDAO;
import com.example.model.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/resolutions")
public class ResolutionController {

    @Autowired
    private ResolutionDAO resolutionDAO;

    @GetMapping
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("admin/resolutions/list");
        mav.addObject("resolutions", resolutionDAO.findAll());
        mav.addObject("titre", "Gestion des Résolutions");
        return mav;
    }

    @GetMapping("/nouveau")
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("admin/resolutions/form");
        mav.addObject("resolution", new Resolution());
        mav.addObject("action", "Créer");
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Resolution resolution, RedirectAttributes ra) {
        resolutionDAO.save(resolution);
        ra.addFlashAttribute("message", "Résolution enregistrée avec succès");
        return "redirect:/admin/resolutions";
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView edit(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/resolutions/form");
        mav.addObject("resolution", resolutionDAO.findById(id).orElse(null));
        mav.addObject("action", "Modifier");
        return mav;
    }

    @GetMapping("/supprimer/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        resolutionDAO.deleteById(id);
        ra.addFlashAttribute("message", "Résolution supprimée");
        return "redirect:/admin/resolutions";
    }
}
