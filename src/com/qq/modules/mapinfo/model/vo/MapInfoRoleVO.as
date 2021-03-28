package com.qq.modules.mapinfo.model.vo
{
   import PVZ.Cmd.Dto_War_Target;
   import PVZ.Cmd.E_WarTargetType;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.map.model.templates.MapTempleTemplate;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   
   public class MapInfoRoleVO
   {
       
      
      private var dto:Dto_War_Target;
      
      private var _pos:Point;
      
      private var _isMe:Boolean;
      
      private var _templateTemple:MapTempleTemplate;
      
      public function MapInfoRoleVO(param1:Int64, param2:Dto_War_Target = null)
      {
         super();
         if(param2)
         {
            this.loadDto(param1,param2);
         }
      }
      
      public function loadDto(param1:Int64, param2:Dto_War_Target) : void
      {
         this.dto = param2;
         if(param2.roleInfo)
         {
            this._isMe = param1.compare(param2.roleInfo.roleId);
         }
      }
      
      public function get isMe() : Boolean
      {
         return this._isMe;
      }
      
      public function get roleId() : Int64
      {
         return this.dto.roleInfo.roleId;
      }
      
      public function get allianceName() : String
      {
         if(this.dto.roleInfo && this.dto.roleInfo.guildName)
         {
            return this.dto.roleInfo.guildName;
         }
         return null;
      }
      
      public function get roleName() : String
      {
         var _loc1_:String = null;
         if(this.type == E_WarTargetType.E_WarTargetType_Mine)
         {
            _loc1_ = this.allianceName;
         }
         else if(this.type == E_WarTargetType.E_WarTargetType_Temple)
         {
            _loc1_ = this.allianceName;
         }
         if(_loc1_ == null)
         {
            if(this.dto.roleInfo == null)
            {
               _loc1_ = "僵尸";
            }
            else
            {
               _loc1_ = this.dto.roleInfo.roleName;
            }
         }
         return _loc1_;
      }
      
      public function get roleFullName() : String
      {
         if(this.isMe)
         {
            return "我";
         }
         return UtilsManager.roleNameCut(this.roleName);
      }
      
      public function get type() : int
      {
         return this.dto.type;
      }
      
      public function getTargetFullName(param1:Boolean = false, param2:Boolean = false) : String
      {
         var _loc3_:String = null;
         if(this.type == E_WarTargetType.E_WarTargetType_Mine)
         {
            _loc3_ = "矿区";
         }
         else if(this.type == E_WarTargetType.E_WarTargetType_Temple)
         {
            _loc3_ = this.templateTemple.name;
         }
         else if(this.type == E_WarTargetType.E_WarTargetType_City)
         {
            if(param2)
            {
               _loc3_ = this.roleName;
            }
            else
            {
               _loc3_ = "小镇";
            }
            param1 = false;
         }
         return _loc3_ + (!!param1 ? "(" + this.pos.x + ", " + this.pos.y + ")" : "");
      }
      
      public function get templateTemple() : MapTempleTemplate
      {
         if(this._templateTemple == null)
         {
            this._templateTemple = MapTemplateFactory.instance.getMapTempleTemplateById(this.dto.id);
         }
         return this._templateTemple;
      }
      
      public function get pos() : Point
      {
         if(!this._pos)
         {
            this._pos = new Point(this.dto.pos.posX,this.dto.pos.posY);
         }
         return this._pos;
      }
   }
}
