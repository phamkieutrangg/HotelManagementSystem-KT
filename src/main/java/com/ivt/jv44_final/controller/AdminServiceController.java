/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.controller;

import com.ivt.jv44_final.entities.BookingDetailEntity;
import com.ivt.jv44_final.entities.BookingEntity;
import com.ivt.jv44_final.entities.GuestEntity;
import com.ivt.jv44_final.entities.RoomEntity;
import com.ivt.jv44_final.entities.ServiceBookingEntity;
import com.ivt.jv44_final.entities.ServiceEntity;
import com.ivt.jv44_final.enums.BookingStatus;
import com.ivt.jv44_final.enums.Gender;
import com.ivt.jv44_final.enums.RoomStatus;
import com.ivt.jv44_final.service.BookingDetailService;
import com.ivt.jv44_final.service.BookingService;
import com.ivt.jv44_final.service.GuestService;
import com.ivt.jv44_final.service.ImageService;
import com.ivt.jv44_final.service.RoomService;
import com.ivt.jv44_final.service.RoomTypeService;
import com.ivt.jv44_final.service.ServiceBookingService;
import com.ivt.jv44_final.service.ServiceService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author KT
 */
@Controller
@RequestMapping("/admin")
public class AdminServiceController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @RequestMapping("/viewDetailService/{bookingId}")
    public String viewDetailService(Model model, HttpSession session, @PathVariable("bookingId") int bookingId) {
        model.addAttribute("bookingDetails", bookingDetailService.findBookingDetailById(bookingId));
        model.addAttribute("booking", bookingService.getBooking(bookingId));
        model.addAttribute("serviceBooking", serviceBookingService.findBookingDetailById(bookingId));
        model.addAttribute("bookingStatus", BookingStatus.values());
        session.setAttribute("booking", bookingService.getBooking(bookingId));
        return "admin/viewDetailService";
    }

    @RequestMapping("/add-serviceBooking/{roomId}")
    public String viewServiceBooking(Model model, @PathVariable("roomId") int roomId, HttpSession session,
            @SessionAttribute("booking") BookingEntity booking,
            @ModelAttribute("service") ServiceEntity service) {
        session.setAttribute("room", roomService.getRoom(roomId));
        model.addAttribute("services", serviceService.getServices());
        session.setAttribute("serviceBookings", new ArrayList<ServiceBookingEntity>());
        return "admin/add-service-booking";
    }

    @RequestMapping(value = "add-service/{serviceId}", method = RequestMethod.POST)
    public String viewAdd(Model model, HttpSession session, @PathVariable("serviceId") int serviceId,
            @RequestParam("quantity") int quantity,
            @SessionAttribute("booking") BookingEntity booking,
            @SessionAttribute("room") RoomEntity room,
            @SessionAttribute("serviceBookings") List<ServiceBookingEntity> serviceBookings) {
        model.addAttribute("services", serviceService.getServices());
        ServiceEntity service = serviceService.getService(serviceId);
        ServiceBookingEntity serviceBooking;
        for (ServiceBookingEntity serviceBookingg : serviceBookings) {
            if (serviceId == serviceBookingg.getService().getId()) {
                serviceBookingg.setQuantity(serviceBookingg.getQuantity() + quantity);
                return "admin/add-service-booking";
            }
        }
        serviceBooking = new ServiceBookingEntity();
        serviceBooking.setQuantity(quantity);
        serviceBooking.setService(service);
        serviceBooking.setPrice(service.getPrice());
        serviceBooking.setBookingDetail(bookingDetailService.findBookingDetailByBookingIdRoomId(booking.getId(), room.getId()));
        serviceBookings.add(serviceBooking);
        return "admin/add-service-booking";

    }

    @RequestMapping(value = {"/view_service_booking"}, method = RequestMethod.POST)
    public String viewServiceBooking(Model model, HttpSession session,
            @SessionAttribute("booking") BookingEntity booking,
            @SessionAttribute("room") RoomEntity room,
            @SessionAttribute("serviceBookings") List<ServiceBookingEntity> serviceBookings) {
        List<ServiceBookingEntity> serviceBookingg = serviceBookingService.getServiceBookings();
        for (ServiceBookingEntity serviceBooking : serviceBookings) { 
            boolean check = false;
            for (ServiceBookingEntity serviceBookingEntity : serviceBookingg) { 
                if (serviceBooking.getService().getId() == serviceBookingEntity.getService().getId()
                        && serviceBooking.getBookingDetail().getId() == serviceBookingEntity.getBookingDetail().getId()) {
                    serviceBookingEntity.setQuantity(serviceBooking.getQuantity() + serviceBookingEntity.getQuantity());
                    serviceBookingService.saveServiceBooking(serviceBookingEntity);
                    check = true;
                }
            }
            if (check == false) {
                serviceBookingService.saveServiceBooking(serviceBooking);
            }
        }
        session.removeAttribute("serviceBookings");
        return "redirect:/admin/viewDetailService/" + booking.getId();
    }

    @RequestMapping(value = {"/remove-service-session/{index}"}, method = RequestMethod.GET)
    public String deleteElementProductDetail(Model model, HttpSession session,
            @PathVariable("index") int index,
            @SessionAttribute("serviceBookings") List<ServiceBookingEntity> serviceBookings) {
        serviceBookings.remove(index);
        model.addAttribute("services", serviceService.getServices());
        return "admin/add-service-booking";
    }
}
