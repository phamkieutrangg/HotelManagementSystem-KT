/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.controller;


import com.ivt.jv44_final.entities.GuestEntity;
import com.ivt.jv44_final.enums.Gender;
import com.ivt.jv44_final.enums.PromotionStatus;
import com.ivt.jv44_final.enums.RoomStatus;
import com.ivt.jv44_final.enums.ServiceStatus;
import com.ivt.jv44_final.service.GuestService;
import com.ivt.jv44_final.service.ImageService;
import com.ivt.jv44_final.service.PromotionService;
import com.ivt.jv44_final.service.RoomService;
import com.ivt.jv44_final.service.RoomTypeService;
import com.ivt.jv44_final.service.ServiceBookingService;
import com.ivt.jv44_final.service.ServiceService;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author KT
 */
@Controller
@RequestMapping("/admin")
public class AdminEditController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ServiceBookingService serviceBookingService;
    
    @Autowired
    private GuestService guestService;
    
    @Autowired
    private PromotionService promotionService;
    
    @Autowired
    private ServiceService serviceService;

    @Autowired
    ServletContext servletContext;
    
    

    @RequestMapping("/edit-room/{roomId}")
    public String editRoom(Model model, @PathVariable("roomId") int roomId) {
        model.addAttribute("room", roomService.getRoom(roomId));
        model.addAttribute("roomType", roomTypeService.getRoomTypes());
        model.addAttribute("roomStatus", RoomStatus.values());
        model.addAttribute("action", "edit");
        return "admin/add-room";
    }

    @RequestMapping("/edit-roomType/{roomTypeId}")
    public String editRoomType(Model model, @PathVariable("roomTypeId") int roomTypeId) {
        model.addAttribute("roomType", roomTypeService.getRoomType(roomTypeId));
        model.addAttribute("roomStatus", RoomStatus.values());
        model.addAttribute("action", "edit");
        return "admin/add-roomType";
    }
    @RequestMapping("/edit-promotion/{promotionId}")
    public String editPromtion(Model model, @PathVariable("promotionId") int promotionId) {
        model.addAttribute("promotion", promotionService.getPromotion(promotionId));
        model.addAttribute("promotionStatus", PromotionStatus.values());
        model.addAttribute("action", "edit");
        return "admin/add-promotion";
    }
    @RequestMapping("/edit-service/{serviceId}")
    public String editService(Model model, @PathVariable("serviceId") int serviceId) {
        model.addAttribute("service", serviceService.getService(serviceId));
        model.addAttribute("serviceStatus", ServiceStatus.values());
        model.addAttribute("action", "edit");
        return "admin/add-service";
    }
    @RequestMapping(value = {"/delete-image/{imageId}"}, method = RequestMethod.GET)
    public String deleteProductImage (@PathVariable("imageId") int imageId) {
        int roomTypeId = imageService.getImage(imageId).getRoomType().getId();
        imageService.deleteImage(imageId);
        return "redirect:/admin/edit-roomType/" + roomTypeId;
    }
    @RequestMapping(value = {"/delete-serviceBooking/{serviceBookingId}"}, method = RequestMethod.GET)
    public String deleteServiceBooking (@PathVariable("serviceBookingId") int serviceBookingId) {
        int bookingId = serviceBookingService.getServiceBooking(serviceBookingId).getBookingDetail().getBooking().getId();
        serviceBookingService.deleteServiceBooking(serviceBookingId);
        return "redirect:/admin/viewDetailService/" + bookingId;
    }
    @RequestMapping("/edit-guest/{roomId}/{guestId}")
    public String editGuest(Model model, @PathVariable("guestId") int guestId,@PathVariable("roomId") int roomId,  
            HttpSession session, GuestEntity guest) {
        
        session.setAttribute("room", roomService.getRoom(roomId));
        model.addAttribute("guest", guestService.getGuest(guestId));
        model.addAttribute("genderStatus", Gender.values());
        model.addAttribute("action", "edit");
        return "admin/guest-info-form";    
    }
    @RequestMapping(value = "/delete-guest/{id}", method = RequestMethod.GET)
    public String delete(Model model,
            @PathVariable("id") int id) {
        guestService.deleteGuest(id);
        return "redirect:/admin/edit-user?status=CHECK_IN";
    }

} 
