/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.controller;

import com.ivt.jv44_final.entities.BookingEntity;
import com.ivt.jv44_final.entities.RoomEntity;
import com.ivt.jv44_final.service.BookingService;
import com.ivt.jv44_final.service.PromotionService;
import com.ivt.jv44_final.service.RoomService;
import com.ivt.jv44_final.service.RoomTypeService;
import com.ivt.jv44_final.service.ServiceBookingService;
import com.ivt.jv44_final.service.ServiceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author KT
 */
@Controller
@RequestMapping("/admin")
public class AdminViewController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private BookingService bookingService;


    @RequestMapping("/view-all-rooms")
    public String viewAllRooms(Model model, @ModelAttribute("room") RoomEntity room) {
        model.addAttribute("rooms", roomService.getRooms());
        return "admin/view-all-rooms";
    }

    @RequestMapping("/view-roomType")
    public String viewRoomType(Model model) {
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        return "admin/view-roomType";
    }

    @RequestMapping("/view-promotion")
    public String viewPromotion(Model model) {
        model.addAttribute("promotions", promotionService.getPromotions());
        return "admin/view-promotion";
    }

    @RequestMapping("/view-service")
    public String viewService(Model model) {
        model.addAttribute("services", serviceService.getServices());
        return "admin/view-service";
    }

    @RequestMapping("/view-booking")
    public String viewBooking(Model model) {
        List<BookingEntity> bookings = bookingService.getBookings();
        model.addAttribute("bookings", bookingService.setTotalPrice(bookings));
        return "admin/view-all-bookings";
    }

}