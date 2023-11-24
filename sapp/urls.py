from django.urls import path
from sapp import views
urlpatterns =[


# _______________________________ADMIN____________________________________________________


    path('logout',views.logout,name="logout"),
    path('AdminHome',views.AdminHome,name="AdminHome"),
    path('BlockunblockResort',views.BlockunblockResort,name="BlockunblockResort"),
    path('ComplaintAndSendReply',views.ComplaintAndSendReply,name="ComplaintAndSendReplay"),
    path('search_user',views.search_user,name="search_user"),
    path('ResortbasedRating',views.ResortbasedRating,name="ResortbasedRating"),
    path('resort',views.resort,name="resort"),
    path('Resortverification',views.Resortverification,name="Resortverification"),
    path('search_resort',views.search_resort,name="search_resort"),
    path('accept_resort/<int:id>',views.accept_resort,name="accept_resort"),
    path('reject_resort/<int:id>',views.reject_resort,name="reject_resort"),
    path('SendReply/<int:id>',views.SendReply,name="SendReply"),
    path('snd_rply',views.snd_rply,name="snd_rply"),
    path('ViewUser',views.ViewUser,name="viewUser"),
    path('search_userr',views.search_userr,name="search_userr"),
    path('addresort',views.addresort,name="addresort"),
    path('blockresort/<int:id>',views.blockresort,name="blockresort"),
    path('unblockresort/<int:id>',views.unblockresort,name="unblockresort"),
    path('search_resorttt',views.search_resorttt,name="search_resorttt"),
    path('sendrating',views.sendrating,name="sendrating"),


# ______________________________________________________RESORT_____________________________________________


    path('AddFacility',views.AddFacility,name="AddFacility"),
    path('add_facilities',views.add_facilities,name="add_facilities"),
    path('FacilitiesManagement', views.FacilitiesManagement, name="FacilitiesManagement"),
    path('search_faci', views.search_faci, name="search_faci"),
    path('edit_Facility/<int:id>', views.edit_Facility, name="edit_Facility"),
    path('edit_faci', views.edit_faci, name="edit_faci"),
    path('delete_faci/<int:id>', views.delete_faci, name="delete_faci"),
    path('AddRoomManage',views.AddRoomManage,name="AddRoomManage"),
    path('add_rooms',views.add_rooms,name="add_rooms"),
    path('chatwithusers',views.chatwithusers,name="chatwithusers"),
    path('search_usr',views.search_usr,name="search_usr"),
    path('ResortHome', views.ResortHome, name="ResortHome"),
    path('RoomManage', views.RoomManage, name="RoomManage"),
    path('edit_room/<int:id>', views.edit_room, name="edit_room"),
    path('edit_rms', views.edit_rms, name="edit_rms"),
    path('delete_rms/<int:id>', views.delete_rms, name="delete_rms"),
    path('search_room', views.search_room, name="search_room"),
    path('ViewBooking', views.ViewBooking, name="ViewBooking"),
    path('setroom', views.setroom, name="setroom"),
    path('viewallocatedroom', views.viewallocatedroom, name="viewallocatedroom"),

    path('accept_payment/<int:id>', views.accept_payment, name="accept_payment"),
    path('reject_payment/<int:id>', views.reject_payment, name="reject_payment"),
    path('search_booking', views.search_booking, name="search_booking"),
    path('viewpayment', views.viewpayment, name="viewpayment"),
    path('ViewRating', views.ViewRating, name="ViewRating"),
    path('search_rating', views.search_rating, name="search_rating"),
    path('search_payment', views.search_payment, name="search_payment"),
    path('chatwithuser', views.chatwithuser, name='chatwithuser'),
    path('payment_sucess', views.payment_sucess, name='payment_sucess'),
    path('viewfacility', views.viewfacility, name='viewfacility'),
    path('chatview', views.chatview, name='chatview'),
    path('bookresort', views.bookresort, name='bookresort'),
    path('coun_msg/<int:id>', views.coun_msg, name='coun_msg'),
    path('coun_insert_chat/<str:msg>/<int:id>', views.coun_insert_chat, name='coun_insert_chat'),
    # path('user_pay_proceed/<int:id>', views.user_pay_proceed, name='user_pay_proceed'),
    # path('on_payment_success', views.on_payment_success, name='on_payment_success'),
# ________________________________________________________________________________________________________
    path('', views.Login, name="Login"),
    # path('Logout', views.Logout, name="Logout"),
    path('logincode',views.logincode,name="logincode"),
    path('ResortSignup', views. ResortSignup, name="ResortSignup"),
# ___________________________________________WEBSERVICE______________________________________________________________________________

    path('login_code', views.login_code, name='login_code'),
    path('regcode', views.regcode, name='regcode'),
    path('calculate_distance', views.calculate_distance, name='calculate_distance'),
    path('sendcomplaint', views.sendcomplaint, name='sendcomplaint'),
    path('viewreply', views.viewreply, name='viewreply'),
    path('view_bkng_sts', views.view_bkng_sts, name='view_bkng_sts'),
    path('in_message2', views.in_message2, name='in_message2                                                                                '),
    path('view_message2', views.view_message2, name='view_message2'),

]