package com.example.virtualmedico;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.provider.ContactsContract;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class view_hospital extends AppCompatActivity  implements AdapterView.OnItemClickListener {
    ListView l1;
    SharedPreferences sh;
    ArrayList<String> hospitalname,place,pin,post,phone,email,hid;
    public static boolean[] chk;
    SearchView s1;
    String name="",ss="",val="",lid="";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_hospital);
        l1=(ListView)findViewById(R.id.hospital);
        s1=(SearchView)findViewById(R.id.searchView1);

        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());


        viewall();
        try
        {
            if(android.os.Build.VERSION.SDK_INT>9)
            {
                StrictMode.ThreadPolicy policy=new StrictMode.ThreadPolicy.Builder().permitAll().build();
                StrictMode.setThreadPolicy(policy);
            }
        }
        catch(Exception e)
        {

        }
//        new Insert().execute();
        s1.setOnQueryTextListener(new SearchView.OnQueryTextListener() {

            @Override
            public boolean onQueryTextSubmit(String arg0) {
                // TODO Auto-generated method stub
                return false;

            }

            @Override
            public boolean onQueryTextChange(String arg0) {
                // TODO Auto-generated method stub
                name=arg0;
            viewhos(name);
                return true;
            }
        });
   }

    private void viewall() {




        String url = "http://" + sh.getString("ip", "") + ":5000/viewall";


        RequestQueue queue = Volley.newRequestQueue(view_hospital.this);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                // Display the response string.
                Log.d("+++++++++++++++++", response);
//                Toast.makeText(view_hospital.this, ""+response, Toast.LENGTH_SHORT).show();
                try {

                    JSONArray ar = new JSONArray(response);
                    hospitalname = new ArrayList<>();
                    place = new ArrayList<>();
                    pin = new ArrayList<>();
                    post = new ArrayList<>();
                    phone = new ArrayList<>();
                    email = new ArrayList<>();
                    hid = new ArrayList<>();

                    for (int i = 0; i < ar.length(); i++) {
                        JSONObject jo = ar.getJSONObject(i);
                        hospitalname.add(jo.getString("name"));
                        place.add(jo.getString("place"));
                        pin.add(jo.getString("pin"));
                        post.add(jo.getString("post"));
                        phone.add(jo.getString("phone"));
                        email.add(jo.getString("email"));
                        hid.add(jo.getString("login_id"));

//                        Toast.makeText(view_hospital.this, ""+hospitalname+place, Toast.LENGTH_LONG).show();


                    }
//                     ArrayAdapter<String> ad=new ArrayAdapter<>(Home.this,android.R.layout.simple_list_item_1,name);
                    //lv.setAdapter(ad);
                    l1.setAdapter(new custom2(view_hospital.this,hospitalname,place));
                    l1.setOnItemClickListener(view_hospital.this);



                } catch (Exception e) {
                    Log.d("=========", e.toString());
                    //              Toast.makeText(view_hospital.this, ""+e, Toast.LENGTH_SHORT).show();
                }

            }

        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

                Toast.makeText(view_hospital.this, "err" + error, Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();

                params.put("latitude", LocationService.lati);
                params.put("longitude", LocationService.logi);

                params.put("name", name);


                return params;
            }
        };
        queue.add(stringRequest);
    }

    private void viewhos(String name) {





            String url = "http://" + sh.getString("ip", "") + ":5000/view_hospital";


            RequestQueue queue = Volley.newRequestQueue(view_hospital.this);

            StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {

                @Override
                public void onResponse(String response) {
                    // Display the response string.
                    Log.d("+++++++++++++++++", response);
//                Toast.makeText(view_hospital.this, ""+response, Toast.LENGTH_SHORT).show();
                    try {

                        JSONArray ar = new JSONArray(response);
                        hospitalname = new ArrayList<>();
                        place = new ArrayList<>();
                        pin = new ArrayList<>();
                        post = new ArrayList<>();
                        phone = new ArrayList<>();
                        email = new ArrayList<>();
                        hid = new ArrayList<>();

                        for (int i = 0; i < ar.length(); i++) {
                            JSONObject jo = ar.getJSONObject(i);
                            hospitalname.add(jo.getString("name"));
                            place.add(jo.getString("place"));
                            pin.add(jo.getString("pin"));
                            post.add(jo.getString("post"));
                            phone.add(jo.getString("phone"));
                            email.add(jo.getString("email"));
                            hid.add(jo.getString("login_id"));

//                        Toast.makeText(view_hospital.this, ""+hospitalname+place, Toast.LENGTH_LONG).show();


                        }
//                     ArrayAdapter<String> ad=new ArrayAdapter<>(Home.this,android.R.layout.simple_list_item_1,name);
                        //lv.setAdapter(ad);
                        l1.setAdapter(new custom2(view_hospital.this,hospitalname,place));
l1.setOnItemClickListener(view_hospital.this);


                    } catch (Exception e) {
                        Log.d("=========", e.toString());
                        //              Toast.makeText(view_hospital.this, ""+e, Toast.LENGTH_SHORT).show();
                    }

                }

            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {

                    Toast.makeText(view_hospital.this, "err" + error, Toast.LENGTH_SHORT).show();
                }
            }) {
                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<>();

                    params.put("latitude", LocationService.lati);
                    params.put("longitude", LocationService.logi);

                    params.put("name", name);


                    return params;
                }
            };
            queue.add(stringRequest);

    }





    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        int i=position;
        Intent in=new Intent(getApplicationContext(),hospital_profile.class);
        in.putExtra("name", hospitalname.get(i));
        in.putExtra("place", place.get(i));
        in.putExtra("post", post.get(i));
        in.putExtra("pin", pin.get(i));
        in.putExtra("phone", phone.get(i));
        in.putExtra("email", email.get(i));
        in.putExtra("hospital_id", hid.get(i));
        startActivity(in);
    }
}
