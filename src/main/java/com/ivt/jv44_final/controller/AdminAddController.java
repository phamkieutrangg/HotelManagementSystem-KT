/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.controller;

import com.ivt.jv44_final.entities.GuestEntity;
import com.ivt.jv44_final.entities.ImageEntity;
import com.ivt.jv44_final.entities.PromotionEntity;
import com.ivt.jv44_final.entities.RoomEntity;
import com.ivt.jv44_final.entities.RoomTypeEntity;
import com.ivt.jv44_final.entities.ServiceEntity;
import com.ivt.jv44_final.enums.Gender;
import com.ivt.jv44_final.enums.PromotionStatus;
import com.ivt.jv44_final.enums.RoomStatus;
import com.ivt.jv44_final.enums.ServiceStatus;
import com.ivt.jv44_final.service.ImageService;
import com.ivt.jv44_final.service.PromotionService;
import com.ivt.jv44_final.service.RoomService;
import com.ivt.jv44_final.service.RoomTypeService;
import com.ivt.jv44_final.service.ServiceService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KT
 */
@Controller
@RequestMapping("/admin")
public class AdminAddController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ServiceService serviceService;
    @Autowired
    ServletContext servletContext;

    @RequestMapping("/add-room")
    public String addRoom(Model model, @ModelAttribute("room") RoomEntity room) {
        model.addAttribute("room", new RoomEntity());
        model.addAttribute("roomType", roomTypeService.getRoomTypes());
        model.addAttribute("roomStatus", RoomStatus.values());
        model.addAttribute("action", "add");
        return "admin/add-room";
    }

    @RequestMapping(value = {"/result-room"}, method = RequestMethod.POST)
    public String resultRoom(Model model,
            @ModelAttribute("room") RoomEntity room) {
        room.setCreateDate(new Date());
        roomService.saveRoom(room);
        model.addAttribute("rooms", roomService.getRooms());

        return "admin/view-all-rooms";
    }

    @RequestMapping("/add-roomType")
    public String addRoomType(Model model, RoomTypeEntity roomType) {
        model.addAttribute("roomType", new RoomTypeEntity());
        model.addAttribute("roomStatus", RoomStatus.values());
        model.addAttribute("action", "add");
        return "admin/add-roomType";
    }

    @RequestMapping(value = {"/result-roomType"}, method = RequestMethod.POST)
    public String uploadResources(@ModelAttribute("roomType") RoomTypeEntity roomType,
            MultipartFile[] files, HttpServletRequest request,
            Model model) {
        roomType.setCreateDate(new Date());
        List<ImageEntity> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-image" + name;
                }
                
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setRoomType(roomType);
                images.add(image);
                
            } catch (Exception e) {
                System.out.println(e);
            }
        }
                roomType.setImages(imageService.uploadImage(files, request, roomType));
                roomTypeService.saveRoomType(roomType);
 

        return "redirect:/admin/view-roomType";
    }

    @RequestMapping("/add-promotion")
    public String addPromotion(Model model, @ModelAttribute("promotion") PromotionEntity promotion) {
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("promotionStatus", PromotionStatus.values());
        model.addAttribute("action", "add");
        return "admin/add-promotion";
    }

    @RequestMapping(value = {"/result-promotion"}, method = RequestMethod.POST)
    public String resultPromotion(Model model, @RequestParam(value = "file", required = false) MultipartFile photo,
            @ModelAttribute("promotions") PromotionEntity promotion) {
        promotion.setCreateDate(new Date());
        promotion.setImage(imageService.uploadFileHandler(photo));
        promotionService.savePromotion(promotion);
        model.addAttribute("promotions", promotionService.getPromotions());
        return "redirect:/admin/view-promotion";
    }

    @RequestMapping("/add-service")
    public String addService(Model model, @ModelAttribute("service") ServiceEntity service) {
        model.addAttribute("service", new ServiceEntity());
        model.addAttribute("serviceStatus", ServiceStatus.values());
        model.addAttribute("action", "add");
        return "admin/add-service";
    }

    @RequestMapping(value = {"/result-service"}, method = RequestMethod.POST)
    public String resultService(Model model,
            @ModelAttribute("services") ServiceEntity service) {
        service.setCreateDate(new Date());
        serviceService.saveService(service);
        model.addAttribute("services", serviceService.getServices());
        return "admin/view-service";
    }
    
    @RequestMapping("/add-form-guest")
    public String addInfoGuest(Model model, RoomTypeEntity roomType) {
        model.addAttribute("guest", new GuestEntity());
        model.addAttribute("genders", Gender.values());
        model.addAttribute("action", "add");
        return "admin/guest-info-form";
    }

}
