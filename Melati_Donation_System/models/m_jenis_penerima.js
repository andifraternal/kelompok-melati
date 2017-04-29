/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var namatabel ="m_jenis_penerima"; 
var querygetall

var db=require('../Config/dbconnection');  // file koneksi 

var m_jenis_penerima_model={
 
getAll:function(callback){
 
return db.query("Select * from "+ namatabel ,callback);
 
},
 getById:function(id,callback){
 
return db.query("select * from "+ namatabel +"  where Id=?",[id],callback);
 },
 Tambah:function(tabel,callback){
 return db.query("Insert into ? values(?,?,?)",  [namatabel, tabel.Jenis],callback);
 },
 Hapus:function(id,callback){
  return db.query("delete from "+ namatabel +" where Id=?",[id],callback);
 },
 Update:function(id,Tabel,callback){
  return db.query("update "+ namatabel +" set Jenis=? where Id=?",[Tabel.Jenis,id],callback);
 },
 HapusAll:function(item,callback){
var delarr=[];
   for(i=0;i<item.length;i++){
       delarr[i]=item[i].Id;
   }
   return db.query("delete from "+ namatabel +" where Id in (?)",[delarr],callback);
}
 
};
 module.exports=m_jenis_penerima_model;
