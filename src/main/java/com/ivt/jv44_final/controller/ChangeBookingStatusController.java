/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.jv44_final.controller;

import com.ivt.jv44_final.entities.BookingDetailEntity;
import com.ivt.jv44_final.entities.BookingEntity;
import com.ivt.jv44_final.entities.BookingExcelExporter;
import com.ivt.jv44_final.entities.GuestEntity;
import com.ivt.jv44_final.entities.RoomEntity;
import com.ivt.jv44_final.entities.ServiceBookingEntity;
import com.ivt.jv44_final.enums.BookingStatus;
import com.ivt.jv44_final.enums.Gender;
import com.ivt.jv44_final.service.BookingDetailService;
import com.ivt.jv44_final.service.BookingService;
import com.ivt.jv44_final.service.GuestService;
import com.ivt.jv44_final.service.Mail;
import com.ivt.jv44_final.service.RoomService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
public class ChangeBookingStatusController {

    @Autowired
    private Mail mail;

    @Autowired
    private RoomService roomService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private GuestService guestService;

    @RequestMapping(value = {"/edit-user"}, method = RequestMethod.GET)
    public String resultRoom(Model model, 
            @SessionAttribute("booking") BookingEntity booking,
            @RequestParam("status") String status) {
        model.addAttribute("action", "edit");
        BookingEntity bookingData = bookingService.getBooking(booking.getId());
        if (status.equalsIgnoreCase("CHECK_IN")) {
            model.addAttribute("bookingDataStatus", bookingData.getStatus());
            model.addAttribute("bookingStatus", "CHECK_IN");
            model.addAttribute("bookingDetails", bookingDetailService.findBookingDetailById(booking.getId()));
            return "admin/choose-room-of-guest";
        }
        if (status.equalsIgnoreCase("CHECK_OUT")) {
            bookingData.setStatus(BookingStatus.CHECK_OUT);
        } else if (status.equalsIgnoreCase("CANCEL")) {
            StringBuilder sb = new StringBuilder();
            sb.append("Dear " + bookingData.getUser().getFullName() + "!")
                    .append("\n")
                    .append("This letter is to inform you that your booking MD")
                    .append(bookingData.getId())
                    .append(" is cancel successfully.")
                    .append("\n")
                    .append("You booking on ")
                    .append(bookingData.getBookingDate())
                    .append("\n")
                    .append("Check-in Date is ")
                    .append(bookingData.getCheckin())
                    .append(".")
                    .append("\n")
                    .append("Check-out Date is ")
                    .append(bookingData.getCheckout())
                    .append(".")
                    .append("\n")
                    .append(bookingDetailOfGuest(bookingDetailService.findBookingDetailById(booking.getId())));
            String content = sb.toString();
            mail.sendMail("phamkieutrang0807@gmail.com", "Cancel Your Booking", content);
            bookingData.setStatus(BookingStatus.CANCEL);
        }
        bookingService.saveBooking(bookingData);
        return "redirect:/admin/viewDetailService/" + booking.getId();
    }

    @RequestMapping("/add-info-guest/{roomId}")
    public String addRoom(Model model, @ModelAttribute("guest") GuestEntity guest, HttpSession session,
            @SessionAttribute("booking") BookingEntity booking, @RequestParam(value = "message", required = false) String message,
            @PathVariable("roomId") int roomId) {
        BookingDetailEntity bookingDetail = bookingDetailService.findBookingDetailByBookingIdRoomId(booking.getId(), roomId);
        List<GuestEntity> guests = guestService.findServiceBookingByBookingDetailId(bookingDetail.getId());
        int guestNumber = bookingDetail.getRoom().getRoomType().getGuest();
        if (guests.size() == guestNumber) {
            model.addAttribute("message", "message");
            return "redirect:/admin/edit-user?status=CHECK_IN";
        }
        session.setAttribute("room", roomService.getRoom(roomId));
        model.addAttribute("guest", new GuestEntity());
        model.addAttribute("genderStatus", Gender.values());
        model.addAttribute("action", "add");
        return "admin/guest-info-form";
    }

    @RequestMapping(value = {"/result-more-guest"}, method = RequestMethod.POST)
    public String resultRoom(Model model, @SessionAttribute("room") RoomEntity room,
            @SessionAttribute("booking") BookingEntity booking,
            @ModelAttribute("guest") GuestEntity guest) {
        BookingDetailEntity bookingDetail = bookingDetailService.findBookingDetailByBookingIdRoomId(booking.getId(), room.getId());
        List<GuestEntity> guests = guestService.findServiceBookingByBookingDetailId(bookingDetail.getId());
        guest.setBookingDetail(bookingDetail);
        guestService.saveGuest(guest);
        guests.add(guest);
        int guestNumber = bookingDetail.getRoom().getRoomType().getGuest();
        if (guests.size() == guestNumber) {
            return "redirect:/admin/edit-user?status=CHECK_IN";
        }
        return "redirect:/admin/add-info-guest/" + room.getId();
    }

    @RequestMapping(value = {"/check-in"}, method = RequestMethod.GET)
    public String chechIn(Model model, @SessionAttribute("booking") BookingEntity booking) {
        List<BookingDetailEntity> bookingDetails = bookingDetailService.findBookingDetailById(booking.getId());
        int guestNumbers = 0;
        int guest = 0;
        for (BookingDetailEntity bookingDetail : bookingDetails) {
            guestNumbers += bookingDetail.getRoom().getRoomType().getGuest();
            guest += bookingDetail.getGuests().size();
        }
        if (guest < guestNumbers) {
            model.addAttribute("message", "message");
            return "redirect:/admin/edit-user?status=CHECK_IN";
        }

        model.addAttribute("action", "edit");
        BookingEntity bookingData = bookingService.getBooking(booking.getId());
        bookingData.setStatus(BookingStatus.CHECK_IN);
        bookingService.saveBooking(bookingData);
        return "redirect:/admin/viewDetailService/" + booking.getId();
    }

    @RequestMapping(value = {"/check-out"}, method = RequestMethod.GET)
    public String chechOut(Model model, @SessionAttribute("booking") BookingEntity booking) {
        model.addAttribute("action", "edit");
        BookingEntity bookingData = bookingService.getBooking(booking.getId());
        bookingData.setStatus(BookingStatus.CHECK_OUT);
        bookingService.saveBooking(bookingData);
        return "redirect:/admin/viewDetailService/" + booking.getId();
    }

    @RequestMapping(value = {"/back-view-detail"}, method = RequestMethod.GET)
    public String backViewDetail(Model model, @SessionAttribute("booking") BookingEntity booking) {
        return "redirect:/admin/viewDetailService/" + booking.getId();
    }

    @RequestMapping(value = {"/view-list-guest"}, method = RequestMethod.GET)
    public String viewListGuest(Model model, @SessionAttribute("booking") BookingEntity booking) {
        model.addAttribute("bookingStatus", "CHECK_OUT");
        model.addAttribute("bookingDetails", bookingDetailService.findBookingDetailById(booking.getId()));
        return "admin/choose-room-of-guest";
    }

    @RequestMapping("/search-name")
    public String searchName(Model model, @ModelAttribute("search") String search, HttpSession session) {
        List<BookingEntity> bookings = bookingService.searchByName(search);
        model.addAttribute("bookings", bookingService.setTotalPrice(bookings));
        session.setAttribute("search", "search");
        return "admin/view-all-bookings";

    }

    @RequestMapping("/search-dateFrom-dateTo")
    public String searchDate(Model model, @ModelAttribute("dateFrom") String dateFrom,
            @ModelAttribute("dateTo") String dateTo, HttpSession session) throws ParseException {
        session.setAttribute("dateFrom", "dateFrom");
        session.setAttribute("dateTo", "dateTo");
        session.removeAttribute("search");
        List<BookingEntity> bookings = bookingService.searchByDate(new SimpleDateFormat("yyyy-MM-dd").parse(dateFrom), new SimpleDateFormat("yyyy-MM-dd").parse(dateTo));
        model.addAttribute("bookings", bookingService.setTotalPrice(bookings));
        session.setAttribute("bookings", bookings);
        return "admin/view-all-bookings";

    }
    @RequestMapping("/export-file-month")
    public void exportFileMonth(HttpServletResponse response,
            @SessionAttribute("bookings") List<BookingEntity> bookings) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=bookings_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
//
//      bookings = bookingService.getBookings();
        bookingService.setTotalPrice(bookings);

        BookingExcelExporter excelExporter = new BookingExcelExporter(bookings);
        excelExporter.export(response);

    }

    @RequestMapping("/export-file")
    public void exportFile(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=bookings_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<BookingEntity> bookings = bookingService.getBookings();
        bookingService.setTotalPrice(bookings);

        BookingExcelExporter excelExporter = new BookingExcelExporter(bookings);
        excelExporter.export(response);

    }

    public StringBuilder bookingDetailOfGuest(List<BookingDetailEntity> bookingDetails) {
        StringBuilder sbd = new StringBuilder();
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        double roomPrice = 0;
        double roomService = 0;    
        for (BookingDetailEntity bookingDetail : bookingDetails) {
            String room = bookingDetail.getRoom().getRoomType().getName() + " " + bookingDetail.getRoom().getRoomNumber();
            double priceOfRoom = bookingDetail.getPrice() - bookingDetail.getPrice() * bookingDetail.getDiscount() / 100;
            roomPrice += priceOfRoom;     
            String priceOfRoomString = formatter.format(priceOfRoom);
            sbd.append("        Your Room is ")
                    .append(room)
                    .append(" + ")
                    .append(priceOfRoomString)
                    .append("VND.")
                    .append("\n")
                    .append("        ")
                    .append("Service:");    
            for (ServiceBookingEntity serviceBooking : bookingDetail.getServiceBooking()) {
                String service = serviceBooking.getService().getName();
                double priceOfService = serviceBooking.getPrice()*serviceBooking.getQuantity();
                roomService += priceOfService;
                String priceOfServiceString = formatter.format(priceOfService);
                
                sbd.append("                   ")
                        .append(service)
                        .append(" + ")
                        .append(priceOfServiceString)
                        .append("VND.")
                        .append("\n");
            }       
        }
        double totalPrice = roomPrice + roomService;
        String totalPriceString = formatter.format(totalPrice);
        sbd.append("Total your booking is ")
                    .append(totalPriceString)
                    .append("VND.")
                    .append("\n")         
                    .append("I really hope you will come another time if given the chance. ")
                    .append("\n")
                    .append("Sincerely,");

        
        return sbd;
    }

}
