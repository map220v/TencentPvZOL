package com.qq.modules.exped.model.vo
{
   import PVZ.Cmd.Dto_SetoutCityInfo;
   import com.tencent.protobuf.Int64;
   
   public class ExpedCityVO
   {
       
      
      private var m_roleID:Int64;
      
      private var m_roleName:String;
      
      private var m_roleLevel:uint;
      
      private var m_area:uint;
      
      private var m_posX:uint;
      
      private var m_posY:uint;
      
      private var m_enemyState:uint;
      
      private var m_needTime:uint;
      
      private var m_hasData:Boolean;
      
      public function ExpedCityVO()
      {
         super();
         this.m_hasData = false;
      }
      
      public function set dto(param1:Dto_SetoutCityInfo) : void
      {
         this.m_roleID = param1.roleId;
         this.m_roleName = param1.roleName;
         this.m_roleLevel = param1.roleLevel;
         this.m_area = param1.area;
         this.m_posX = param1.pos.posX;
         this.m_posY = param1.pos.posY;
         this.m_enemyState = param1.enemyState;
         this.m_needTime = param1.setoutTime;
         this.m_hasData = true;
      }
      
      public function get hasData() : Boolean
      {
         return this.m_hasData;
      }
      
      public function get roleID() : Int64
      {
         return this.m_roleID;
      }
      
      public function get roleName() : String
      {
         return this.m_roleName;
      }
      
      public function get roleLevel() : uint
      {
         return this.m_roleLevel;
      }
      
      public function get posX() : uint
      {
         return this.m_posX;
      }
      
      public function get posY() : uint
      {
         return this.m_posY;
      }
      
      public function get enemyState() : uint
      {
         return this.m_enemyState;
      }
      
      public function get needTime() : uint
      {
         return this.m_needTime;
      }
      
      public function get area() : uint
      {
         return this.m_area;
      }
      
      public function reset() : void
      {
         this.m_roleID = null;
         this.m_roleName = "";
         this.m_roleLevel = 0;
         this.m_area = 0;
         this.m_posX = 0;
         this.m_posY = 0;
         this.m_enemyState = 0;
         this.m_needTime = 0;
         this.m_hasData = false;
      }
   }
}
