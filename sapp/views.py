from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render
from datetime import datetime
# Create your views here.
import json


from sapp.models import *



def logout(request):
    auth.logout(request)
    return render(request,"admin/login_index.html")
@login_required(login_url='/')
def AdminHome(request):
    return render(request,"admin/admin_index.html")
@login_required(login_url='/')
def Resortverification(request):
    ob=resort_table.objects.all()
    return render(request,"admin/Resortverification.html",{'val':ob})
@login_required(login_url='/')
def search_resort(request):
    name = request.POST['textfield']
    ob = resort_table.objects.filter(resortname__icontains=name)
    return render(request,"admin/Resortverification.html",{'val':ob})
@login_required(login_url='/')
def accept_resort(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='resort'
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location="/Resortverification#about"</script>''')
@login_required(login_url='/')
def reject_resort(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location="/Resortverification#about"</script>''')
@login_required(login_url='/')
def BlockunblockResort(request):
    ob=resort_table.objects.exclude(LOGIN__type="pending")
    return render(request,"admin/BlockunblockResort.html",{'val':ob})
@login_required(login_url='/')
def search_resorttt(request):
    name = request.POST['textfield']
    ob = resort_table.objects.filter(resortname__icontains=name)
    return render(request,"admin/Resortverification.html",{'val':ob})
@login_required(login_url='/')
def unblockresort(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="Resort"
    ob.save()
    return HttpResponse('''<script>alert("unblocked");window.location="/BlockunblockResort#about"</script>''')
@login_required(login_url='/')
def blockresort(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="Blocked"
    ob.save()
    return HttpResponse('''<script>alert("blocked");window.location="/BlockunblockResort#about"</script>''')
@login_required(login_url='/')
def ResortbasedRating(request):
    ob =  rating_table.objects.all()
    ob1 = resort_table.objects.all()
    return render(request,"admin/ResortbasedRating.html",{'val':ob, "val1":ob1})
@login_required(login_url='/')
def resort(request):
    rsrt=request.POST['select']
    ob=rating_table.objects.filter(RESORT=rsrt)
    ob1 = resort_table.objects.all()
    return render(request,"ADMIN/ResortbasedRating.html",{'val':ob,'val1':ob1})
@login_required(login_url='/')
def ComplaintAndSendReply(request):
    ob =  complaint_table.objects.all()
    return  render(request,"admin/ComplaintAndSendReplay.html",{'val':ob})
@login_required(login_url='/')
def search_user(request):
    name = request.POST['textfield']
    ob = complaint_table.objects.filter(USER__username=name)
    return render(request,"admin/Resortverification.html",{'val':ob})

@login_required(login_url='/')
def SendReply(request,id):
    request.session['lid']=id
    return render(request,"admin/SendReply.html")
@login_required(login_url='/')
def snd_rply(request):
    rply = request.POST['textfield']
    ob = complaint_table.objects.get(id=request.session['lid'])
    ob.reply=rply
    ob.save()
    return HttpResponse('''<script>alert("Replied");window.location="/ComplaintAndSendReply#about"</script>''')
@login_required(login_url='/')
def ViewUser(request):
    ob =  user_table.objects.all()
    return render(request,"admin/ViewUser.html",{'val':ob})
@login_required(login_url='/')
def search_userr(request):
    name = request.POST['textfield']
    ob = complaint_table.objects.filter(USER__username__icontains=name)
    return render(request,"admin/ViewUser.html",{'val':ob})




# /////////////////ResortHome/////////////

@login_required(login_url='/')
def FacilitiesManagement(request):
    ob =  facilities_table.objects.filter(RESORT__LOGIN__id=request.session['lid'])
    return render(request,"ResortHome/FacilitiesManagement.html",{'val':ob})
@login_required(login_url='/')
def search_faci(request):
    name = request.POST['textfield']
    ob = facilities_table.objects.filter(RESORT__LOGIN__id=request.session['lid'],facilities=name)
    return render(request,"ResortHome/FacilitiesManagement.html",{'val':ob})
@login_required(login_url='/')
def edit_Facility(request,id):
    request.session['fid'] = id
    ob = facilities_table.objects.get(id=id)
    return render(request, "ResortHome/edit_Facility.html", {'val': ob})
@login_required(login_url='/')
def edit_faci(request):
    if 'file' in request.FILES:
        facility = request.POST['textfield']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)


        fac = facilities_table.objects.get(id=request.session['fid'])
        fac.facilities = facility
        fac.image = fsave
        fac.save()
        return HttpResponse('''<script>alert("Edited");window.location="/FacilitiesManagement"</script>''')

    else:
        facility = request.POST['textfield']
        fac = facilities_table.objects.get(id=request.session['fid'])
        fac.facilities = facility
        fac.save()
        return HttpResponse('''<script>alert("Edited");window.location="/FacilitiesManagement#about"</script>''')
@login_required(login_url='/')
def delete_faci(request,id):
    ob = facilities_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location="/FacilitiesManagement#about"</script>''')


@login_required(login_url='/')
def AddFacility(request):
    return render(request,"ResortHome/AddFacility.html")
@login_required(login_url='/')
def add_facilities(request):
    facility = request.POST['textfield']
    photo = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(photo.name, photo)

    fac = facilities_table()
    fac.facilities=facility
    fac.image=fsave
    fac.RESORT = resort_table.objects.get(LOGIN__id=request.session['lid'])
    fac.save()
    return HttpResponse('''<script>alert("Success Fully Added");window.location='/FacilitiesManagement#about'</script>''')

@login_required(login_url='/')
def RoomManage(request):
    ob =  room_table.objects.all()
    return render(request,"ResortHome/RoomManage.html",{'val':ob})
@login_required(login_url='/')
def edit_room(request,id):
    request.session['rid'] = id
    ob = room_table.objects.get(id=id)
    return render(request, "ResortHome/edit_rooms.html", {'val': ob})
@login_required(login_url='/')
def edit_rms(request):
    if 'file' in request.FILES:
        status = request.POST['select']
        type = request.POST['select2']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)
        rate = request.POST['textfield']

        rm = room_table.objects.get(id=request.session['rid'])
        rm.status = status
        rm.type = type
        rm.image = fsave
        rm.rate = rate
        rm.save()
        return HttpResponse('''<script>alert("Edited");window.location="/RoomManage#about"</script>''')

    else:
        status = request.POST['select']
        type = request.POST['select2']
        rate = request.POST['textfield']
        rm = room_table.objects.get(id=request.session['rid'])
        rm.status = status
        rm.type = type
        rm.rate = rate
        rm.save()
        return HttpResponse('''<script>alert("Edited");window.location="/RoomManage#about"</script>''')
@login_required(login_url='/')
def delete_rms(request,id):
    ob = room_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location="/RoomManage#about"</script>''')
@login_required(login_url='/')
def search_room(request):
    name = request.POST['textfield']
    ob = room_table.objects.filter(type__icontains=name)
    return render(request,"ResortHome/RoomManage.html",{'val':ob})

@login_required(login_url='/')
def AddRoomManage(request):
    ob = room_table.objects.all()
    return render(request,"ResortHome/AddRoomManage.html",{'val':ob})
@login_required(login_url='/')
def add_rooms(request):
    status = request.POST['select']
    photo = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(photo.name, photo)
    rmno = request.POST['textfield1']
    type = request.POST['select2']
    amount= request.POST['textfield']

    ob1 = room_table()
    ob1.status = status
    ob1.image = fsave
    ob1.roomno = rmno
    ob1.type = type
    ob1.rate = amount
    ob1.RESORT = resort_table.objects.get(LOGIN__id=request.session['lid'])
    ob1.save()
    return HttpResponse('''<script>alert("Success Fully Registered");window.location='/RoomManage#about'</script>''')

@login_required(login_url='/')
def chatwithusers(request):
    ob = user_table.objects.all()
    return render(request,"ResortHome/chatwithusers.html",{'val':ob})
@login_required(login_url='/')
def search_usr(request):
    name = request.POST['textfield']
    ob = user_table.objects.filter(username__icontains=name)
    return render(request,"ResortHome/chatwithusers.html",{'val':ob})

@login_required(login_url='/')
def ResortHome(request):
    return render(request,"ResortHome/resort_index.html")


@login_required(login_url='/')
def ViewBooking(request):
    ob = booking_table.objects.filter(RESORT__LOGIN=request.session['lid'])
    return render(request,"ResortHome/ViewBooking.html",{'val':ob})
@login_required(login_url='/')
def search_booking(request):
    name = request.POST['textfield']
    ob = user_table.objects.filter(username__icontains=name)
    return render(request,"ResortHome/ViewBooking.html",{'val':ob})
@login_required(login_url='/')
def accept_payment(request,id):
    request.session['bookid']=id
    ob=booking_table.objects.get(id=id)
    ob.status='accept'
    ob.save()
    ob1=room_table.objects.filter(RESORT__LOGIN=request.session['lid'])
    return render(request,'ResortHome/sendroom.html',{'val':ob1})
@login_required(login_url='/')
def setroom(request):
    room=request.POST['select']
    ob=roomalocation_table()
    ob.date=datetime.today()
    ob.BOOKING=booking_table.objects.get(id=request.session['bookid'])
    ob.ROOM=room_table.objects.get(id=room)
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location="/ViewBooking#about"</script>''')

@login_required(login_url='/')
def reject_payment(request,id):
    ob=booking_table.objects.get(id=id)
    ob.status='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location="/ViewBooking#about"</script>''')
@login_required(login_url='/')
def viewpayment(request):
    ob =  payment_table.objects.all()
    return render(request,"ResortHome/viewpayment.html",{'val':ob})
@login_required(login_url='/')
def search_payment(request):
    dt = request.POST['textfield']
    ob = payment_table.objects.filter(date=dt)
    return render(request,"ResortHome/viewpayment.html",{'val':ob})
@login_required(login_url='/')
def ViewRating(request):
    ob = rating_table.objects.all()
    return render(request,"ResortHome/ViewRating.html",{'val':ob})
@login_required(login_url='/')
def search_rating(request):
    name = request.POST['textfield']
    ob = rating_table.objects.filter(USER__username__icontains=name)
    return render(request,"ResortHome/ViewBooking.html",{'val':ob})




# ______________________________________LOGIN___________________________________________________________________


def Login(request):
    return render(request, "admin/login_index.html")

def logincode(request):
    print(request.POST)
    try:
        username=request.POST['textfield']
        pwd = request.POST['textfield2']

        ob=login_table.objects.get(username=username,password=pwd)
        if ob.type=="admin":
            ob1 = auth.authenticate(username='admin', password='admin@123')
            if ob1 is not None:
                auth.login(request, ob1)
            request.session['lid'] = ob.id
            return HttpResponse('''<script>alert("Welcome to Admin Home...!");window.location="/AdminHome"</script>''')
        elif ob.type=="Resort":
            ob1 = auth.authenticate(username='admin', password='admin@123')
            if ob1 is not None:
                auth.login(request, ob1)
            request.session['lid'] = ob.id
            return HttpResponse('''<script>alert("Welcome to Resort Home...!");window.location="/ResortHome"</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid Username or Password");window.location="/logout</script>''')
    except:
        return HttpResponse('''<script>alert("Invalid");window.location="/logout"</script>''')

# def Logout(request):
#     return render(request, "Login/Login.html")

def ResortSignup(request):
    return render(request, "admin/li_register_index.html")


def addresort(request):
    name=request.POST['textfield']
    place=request.POST['textfield2']
    post=request.POST['textfield3']
    pin=request.POST['textfield4']
    Image=request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(Image.name,Image)

    Email=request.POST['textfield5']
    Phone=request.POST['textfield6']
    Latitude=request.POST['textfield7']
    Lougitude=request.POST['textfield8']
    Username=request.POST['textfield9']
    password=request.POST['textfield10']


    ob=login_table()
    ob.username=Username
    ob.password=password
    ob.type="pending"
    ob.save()


    obj=resort_table()
    obj.LOGIN=ob
    obj.resortname=name
    obj.place=place
    obj.post=post
    obj.pin=pin
    obj.image=fn
    obj.email=Email
    obj.phone=Phone
    obj.lattitude=Latitude
    obj.longitude=Lougitude
    obj.save()
    return HttpResponse('''<script>alert("registered");window.location="/"</script>''')








"=======================chat===================="
@login_required(login_url='/')
def chatwithuser(request):
    ob = user_table.objects.all()
    return render(request,"ResortHome/chat.html",{'val':ob})

@login_required(login_url='/')
def chatview(request):
    ob = user_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.username,'photo':i.image.url,'email':i.email,'loginid':i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)

@login_required(login_url='/')
def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=chat_table()
    ob.fromid=login_table.objects.get(id=request.session['lid'])
    ob.toid=login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.save()

    return JsonResponse({"task":"ok"})
    # refresh messages chatlist


@login_required(login_url='/')
def coun_msg(request,id):

    ob1=chat_table.objects.filter(fromid__id=id,toid__id=request.session['lid'])
    ob2=chat_table.objects.filter(fromid__id=request.session['lid'],toid__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.fromid.id,"msg":i.message,"date":i.date,"chat_id":i.id})

    obu=user_table.objects.get(LOGIN__id=id)


    return JsonResponse({"data":res,"name":obu.username,"photo":obu.image.url,"user_lid":obu.LOGIN.id})



"==================chatcompleted================================="





# "==========payment====================="
# @login_required(login_url='/')
# def user_pay_proceed(request,id):
#
#     request.session['bid']=id
#     amount = request.POST['textfield']
#     request.session['pay_amount'] = amount
#     client = razorpay.Client(auth=("rzp_test_edrzdb8Gbx5U5M", "XgwjnFvJQNG6cS7Q13aHKDJj"))
#     print(client)
#     payment = client.order.create({'amount': amount+"00", 'currency': "INR", 'payment_capture': '1'})
#     res=user_table.objects.get(LOGIN__id=request.session['lid'])
#     return render('UserPayProceed.html', {'p':payment,'val':res})
#
#
#
# @login_required(login_url='/')
# def on_payment_success(request):
#     amt = request.session['pay_amount']
#     ob=payment_table()
#     ob.date=datetime.today()
#     ob.time=datetime.now()
#     ob.BOOKING=booking_table.objects.get(id=request.session['bid'])
#     ob.payment=amt
#     ob.save()
#
#     # qry = "UPDATE `charity_information` SET `amount`=`amount`-%s WHERE `id`=%s"
#     # iud(qry, (amt,charity))
#
#     return HttpResponse('''<script>alert("Success! Thank you for your Contribution");window.location="userhome"</script>''')
# "================================================"


# ____________________________________________WEBSERVICE___________________________________________________________________________________________________________

def login_code(request):
    print(request.POST)
    un = request.POST['uname']
    pw = request.POST['pswrd']
    try:
        users = login_table.objects.get(username = un, password = pw,type = 'user')
        print(users)
        if users is None:
            data = {"task" : "invalid"}
        else:
            data = {"task" : "valid","lid":users.id}
        l = json.dumps(data)
        return HttpResponse(l)
    except:
        data = {"task": "invalid"}
        l = json.dumps(data)
        return HttpResponse(l)
def regcode(request):
    unm = request.POST['name']
    plc = request.POST['plc']
    pst = request.POST['pst']
    pn = request.POST['pin']
    eml = request.POST['email']
    phn = request.POST['phn']
    image = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)
    un = request.POST['uname']
    pw = request.POST['pswrd']
    lob = login_table()
    lob.username = un
    lob.password = pw
    lob.type = 'user'
    lob.save()
    uob = user_table()
    uob.username = unm
    uob.place = plc
    uob.post = pst
    uob.pin = pn
    uob.email = eml
    uob.phone = phn
    uob.image = fsave
    uob.LOGIN = lob
    uob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)




def payment_sucess(request):
    bid = request.POST['bid']
    amt = request.POST['amt']

    lob = payment_table()
    lob.date = datetime.today()
    lob.time = datetime.now()
    lob.BOOKING= booking_table.objects.get(id=bid)
    lob.payment=amt
    lob.save()
    lobd = booking_table.objects.get(id=bid)
    lobd.status='PAID'
    lobd.save()
    data = {"task": "success"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)


def bookresort(request):
    print(request.POST,"llllllllllll")
    bid = request.POST['rid']
    amt = request.POST['lid']
    lob = booking_table()
    lob.date = datetime.today()
    lob.RESORT = resort_table.objects.get(id=bid)
    lob.USER = user_table.objects.get(LOGIN__id=amt)
    lob.status = 'pending'
    lob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)


def calculate_distance(request):
    from math import sin, cos, sqrt, atan2, radians
    lat1 = float(request.POST.get('latitude', 0.0))
    lon1 = float(request.POST.get('longitude', 0.0))
    lat1 = radians(lat1)
    lon1 = radians(lon1)
    ob = resort_table.objects.all()
    r = []

    for i in ob:
        lat2 = i.lattitude
        lon2 = i.longitude

        # Convert latitude and longitude to radians if they are in degrees

        lat2 = radians(lat2)
        lon2 = radians(lon2)

        dlon = lon2 - lon1
        dlat = lat2 - lat1

        a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
        a = min(1.0, a)  # Ensure 'a' is not greater than 1 to avoid math domain error
        c = 2 * atan2(sqrt(a), sqrt(1 - a))

        # Approximate radius of the Earth in kilometers
        R = 6373.0
        distance = R * c
        print(distance,"==================================")
        if distance < 1000:
            row = {'name': i.resortname, 'image': str(i.image),'details':i.place,'post':i.post,'pin':i.pin,'phone':i.phone,'email':i.email,'lati':i.lattitude,'longi':i.longitude,'id':i.id}
            r.append(row)
    print(r,"hhhhhhhhhhhhhhh")
    print(len(r),"hhhhhhhhhhhhhhh")
    return JsonResponse(r, safe=False)



# def calculate_distance(request):
#     print(request.POST)
#     lat1 = float(request.POST['latitude'])
#     lon1 = float(request.POST['longitude'])
#     from math import sin, cos, sqrt, atan2, radians
#     ob = resort_table.objects.all()
#     r = []
#     for i in ob:
#         lat2 = i.lattitude
#         lon2 = i.longitude
#         # Approximate radius of earthc in km
#         R = 6373.0
#
#         # lat1 = radians(lat1)
#         # lon1 = radians(lon1)
#         # lat2 = radians(lat2)
#         # lon2 = radians(lon2)
#
#         dlon = lon2- lon1
#         dlat = lat2- lat1
#
#         a = sin(dlat / 2) * 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) * 2
#         c = 2 * atan2(sqrt(a), sqrt(1 - a))
#
#         distance = R * c
#         if distance < 1000:
#
#
#             row = {'name': i.resortname, 'image': str(i.image) }
#             r.append(row)
#             print(r)
#     return HttpResponse(r)

def sendcomplaint(request):
    complaintss=request.POST['complaint']
    lid=request.POST['lid']
    lob=complaint_table()
    lob.compaint = complaintss
    lob.date=datetime.now()
    lob.reply='pending'
    lob.USER=user_table.objects.get(LOGIN__id=lid)
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)

def sendrating(request):
    rid=request.POST['rid']
    rat=request.POST['rating']
    review=request.POST['review']
    lid=request.POST['lid']
    lob=rating_table()
    lob.rate = rat
    lob.feedback = review
    lob.date=datetime.now()
    lob.RESORT=resort_table.objects.get(id=rid)
    lob.USER=user_table.objects.get(LOGIN__id=lid)
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)


def viewreply(request):
    lid=request.POST['lid']
    ob=complaint_table.objects.filter(USER__LOGIN__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'comp':i.compaint,'reply':i.reply,'date': str(i.date)}
        mdata.append(data)
        print(mdata)
    r=json.dumps(mdata)
    return HttpResponse(r)


def viewallocatedroom(request):
    lid=request.POST['lid']
    ob=roomalocation_table.objects.filter(BOOKING__USER__LOGIN__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'facilities':i.ROOM.roomno,'img': i.ROOM.image.url[7:],'id':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)


def viewfacility(request):
    lid=request.POST['rid']
    print(lid)
    ob=facilities_table.objects.filter(RESORT__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'facilities':i.facilities,'img': i.image.url[7:],'id':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)


def view_bkng_sts(request):
    bkid = request.POST['lid']
    ob = booking_table.objects.filter(USER__LOGIN__id=bkid)
    data = []
    for i in ob:
        row = { "dt": str(i.date), "name": i.RESORT.resortname,"sts": i.status, "img": i.RESORT.image.url[7:], "rsrt": i.RESORT.id, "plc":i.RESORT.place,'id':i.id}
        data.append(row)
        print(data)
    r = json.dumps(data)
    return HttpResponse(r)


# ============chat_________________

def in_message2(request):

    fromid = request.POST['fid']
    print(request.POST,"gf")
    toid = request.POST['toid']
    ob = resort_table.objects.get(id=toid)
    toid = ob.LOGIN.id
    print("toid",toid)
    message=request.POST['msg']
    ob=chat_table()
    ob.fromid=login_table.objects.get(id=fromid)
    ob.toid=login_table.objects.get(id=toid)
    ob.message=message
    ob.date=datetime.today()
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)

    # qry = "INSERT INTO `chat` VALUES(NULL,%s,%s,%s,CURDATE())"
    # value = (fromid, toid, message)
    # print("pppppppppppppppppp")
    # print(value)
    # iud(qry, value)
    # return jsonify(status='send')


def view_message2(request):
    print(request.POST)
    fromid=request.POST['fid']

    print(fromid)
    toid=request.POST['toid']
    print(toid)
    ob = resort_table.objects.get(id=toid)
    toid=ob.LOGIN.id
    print(toid,"+++++++++++++++++++++++")
    lmid = request.POST['lastmsgid']
    print("msgggggggggggggggggggggg"+lmid)
    from django.db import connection
    cursor=connection.cursor()


    sen_res = []
    # qry="SELECT * FROM chat WHERE (fromid=%s AND toid=%s) OR (fromid=%s AND toid=%s) ORDER BY DATE ASC"
    cursor.execute("SELECT `fromid_id` as from_id,`message`,`date`,`id` FROM `sapp_chat_table` WHERE `id`>'"+lmid+"' AND ((`toid_id`='"+str(toid)+"' AND  `fromid_id`='"+str(fromid)+"') OR (`toid_id`='"+str(fromid)+"' AND `fromid_id`='"+str(toid)+"')  )  ORDER BY id ASC")
    # print("SELECT `from_id`,`message`,`date`,`chat_id` FROM `chat` WHERE `chat_id`>%s AND ((`to_id`=%s AND  `from_id`=%s) OR (`to_id`=%s AND `from_id`=%s)  )  ORDER BY chat_id ASC''')
    res=cursor.fetchall()
    print(res,"============================")
    data = []
    for i in res:
        row = {"from_id": i[0], "chat": i[1], "date": str(i[2]),
               'id': i[3]}
        data.append(row)
    data1 = {"res1": data,"status":"ok"}
    r = json.dumps(data1)
    return HttpResponse(r)




