package com.qq.modules.map.model.vo
{
   import PVZ.Cmd.Dto_Guild_FlagInfo;
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.modules.map.model.templates.MapCellPropTemplate;
   import com.qq.modules.map.model.templates.MapCellSkinTemplate;
   import com.qq.modules.map.model.templates.MapLevelTemplate;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.map.util.IQMapRule;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   
   public class MapBasicCellVO implements IQMapRule
   {
       
      
      public var isRealCell:Boolean = true;
      
      protected var dto:Dto_WorldMap_CellInfo;
      
      protected var m_privilegeDiamond:PrivilegeDiamond;
      
      public var isMine:Boolean;
      
      protected var _myWord:String;
      
      protected var _pos:Point;
      
      protected var _type:int;
      
      private var _template:MapCellPropTemplate;
      
      protected var _skinTemplate:MapCellSkinTemplate;
      
      protected var _name:String;
      
      public function MapBasicCellVO(param1:Dto_WorldMap_CellInfo = null, param2:Int64 = null)
      {
         super();
         if(param1)
         {
            this.loadDto(param1);
         }
         if(param2)
         {
            this.isMine = param2.compare(this.roleId);
         }
      }
      
      public function get privilegeDiamond() : PrivilegeDiamond
      {
         return this.m_privilegeDiamond;
      }
      
      public function get roleId() : Int64
      {
         if(!this.dto)
         {
            return null;
         }
         return this.dto.roleId;
      }
      
      public function loadDto(param1:Dto_WorldMap_CellInfo) : void
      {
         this.dto = param1;
         this.m_privilegeDiamond = PrivilegeDiamond.createByInfo(param1.diamond);
         if(param1.pos)
         {
            this._pos = new Point(param1.pos.posX,param1.pos.posY);
         }
         else
         {
            this._pos = new Point();
         }
         if(param1.roleId)
         {
            this._name = "cell_" + param1.roleId.toString(16);
         }
         else
         {
            this._name = "cell_" + this._pos;
         }
      }
      
      public function get area() : int
      {
         if(this.dto)
         {
            return this.dto.area;
         }
         return 0;
      }
      
      public function get guildFlag() : Dto_Guild_FlagInfo
      {
         if(this.dto == null)
         {
            return null;
         }
         return this.dto.guildFlag;
      }
      
      public function get enemyFlag() : Dto_Guild_FlagInfo
      {
         if(this.dto == null)
         {
            return null;
         }
         return this.dto.enemyFlag;
      }
      
      public function loadVo(param1:MapBasicCellVO) : void
      {
         if(param1 != this)
         {
            this.dto = param1.dto;
         }
      }
      
      public function get myWord() : String
      {
         return this._myWord;
      }
      
      public function get pos() : Point
      {
         return this._pos;
      }
      
      public function get type() : int
      {
         if(this._type)
         {
            return this._type;
         }
         return this.dto.type;
      }
      
      public function get avatar() : uint
      {
         if(this.dto && this.dto.avatar)
         {
            return this.dto.avatar;
         }
         return this.template.skin;
      }
      
      public function get roleName() : String
      {
         if(!this.dto)
         {
            return null;
         }
         return this.dto.roleName;
      }
      
      public function get template() : MapCellPropTemplate
      {
         if(this._template == null)
         {
            this._template = MapTemplateFactory.instance.getMapCellPropTemplateById(this.type);
         }
         return this._template;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function getInvisibleRect() : Rectangle
      {
         return new Rectangle(this.pos.x + this.skinTemplate.rect.x,this.pos.y + this.skinTemplate.rect.y,this.skinTemplate.rect.width + 1,this.skinTemplate.rect.height + 1);
      }
      
      public function get skinTemplate() : MapCellSkinTemplate
      {
         if(this._skinTemplate == null)
         {
            this._skinTemplate = MapTemplateFactory.instance.getMapCellSkinTemplateById(this.avatar);
         }
         return this._skinTemplate;
      }
      
      public function checkContain(param1:Point) : Boolean
      {
         return this.skinTemplate.contain(this.pos,param1);
      }
      
      public function getTip(param1:int) : String
      {
         var _loc2_:String = this.getMapName(param1);
         return "坐标：" + this.pos.x + ", " + this.pos.y + "\n" + "所在：" + _loc2_;
      }
      
      public function getMapName(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:MapLevelTemplate = MapTemplateFactory.instance.getMapLevelTemplateById(param1);
         if(_loc3_ == null)
         {
            _loc2_ = "";
         }
         else
         {
            _loc2_ = _loc3_.name;
         }
         return _loc2_;
      }
      
      public function compare(param1:MapBasicCellVO) : Boolean
      {
         if(param1.roleId && this.roleId)
         {
            return param1.roleId.compare(this.roleId);
         }
         return param1.pos.equals(this.pos);
      }
      
      public function compareDTO(param1:Dto_WorldMap_CellInfo) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1.roleId && this.roleId)
         {
            return param1.roleId.compare(this.roleId);
         }
         if(param1.pos == null)
         {
            return false;
         }
         return param1.pos.posX == this.pos.x && param1.pos.posY == this.pos.y;
      }
      
      public function compareTiledObjectData(param1:TiledObjectData) : Boolean
      {
         return this.checkContain(new Point(param1.cellX,param1.cellY));
      }
   }
}
