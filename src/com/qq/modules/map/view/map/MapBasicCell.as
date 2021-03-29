package com.qq.modules.map.view.map
{
   import PVZ.Cmd.Dto_Guild_FlagInfo;
   import asgui.resources.AssetManager;
   import asgui.styles.StyleManager;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.union.view.UnionFlagView;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import org.allencuilib.map.interfaces.IMapRole;
   
   public class MapBasicCell extends Sprite implements IMapRole
   {
       
      
      protected var mc:MovieClip;
      
      public var vo:MapBasicCellVO;
      
      protected var txt:TextField;
      
      protected var allianceFlag:UnionFlagView;
      
      protected var allianceFlagOffsetY:int = 0;
      
      protected var allianceIcon:UnionFlagView;
      
      protected var hasAllianceFlag:Boolean = false;
      
      protected var hasAllianceFlagByOther:Boolean = false;
      
      protected var hasAllianceIcon:Boolean = false;
      
      private var lastMcSkin:int;
      
      private var back:Bitmap;
      
      public function MapBasicCell()
      {
         super();
         this.mouseChildren = this.mouseEnabled = false;
         this.back = new Bitmap(AssetManager.GetNewClass("Map_Cell_Name_Back.png") as BitmapData);
         this.back.x = -this.back.width / 2;
         this.back.y = MapGlobals.bg.data.tileheight - 14;
         this.back.visible = false;
         this.addChild(this.back);
         this.txt = new TextField();
         this.txt.background = true;
         this.txt.mouseEnabled = false;
         this.txt.height = 22;
         this.txt.width = 130;
         this.txt.y = MapGlobals.bg.data.tileheight - 12;
         this.txt.x = -this.txt.width / 2;
         StyleManager.GetStyleDeclaration(".TXT_Normal_14_ThinBorder").SetTextFieldStyle(this.txt);
         this.txt.textColor = 16777215;
         this.txt.visible = false;
         this.addChild(this.txt);
      }
      
      public function StageClickTo(param1:Vector.<Point>) : void
      {
      }
      
      public function get microTargets() : Vector.<Point>
      {
         return null;
      }
      
      public function StopMoving() : void
      {
      }
      
      public function GetPixelAt(param1:Number, param2:Number) : uint
      {
         var _loc3_:Rectangle = new Rectangle(-50,-50,100,100);
         return !!_loc3_.contains(param1,param2) ? uint(4294967295) : uint(0);
      }
      
      public function get targetX() : Number
      {
         return 0;
      }
      
      public function get targetY() : Number
      {
         return 0;
      }
      
      public function get depth() : int
      {
         return y;
      }
      
      public function Dispose() : void
      {
         this.vo = null;
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
      }
      
      public function loadVO(param1:MapBasicCellVO) : void
      {
         var _loc3_:Dto_Guild_FlagInfo = null;
         this.vo = param1;
         this.name = param1.name;
         if(this.lastMcSkin != param1.skinTemplate.id)
         {
            if(this.mc)
            {
               this.removeChild(this.mc);
            }
            this.mc = AssetManager.GetNewClass("Map_Building_" + param1.skinTemplate.id) as MovieClip;
            this.mc.stop();
            this.mc.y = MapGlobals.bg.data.tileheight;
            this.addChildAt(this.mc,0);
            if(this.hasAllianceFlag && param1.guildFlag || this.hasAllianceFlagByOther && param1.enemyFlag)
            {
               if(!this.allianceFlag)
               {
                  this.allianceFlag = new UnionFlagView();
                  this.allianceFlag.x = -14;
                  this.allianceFlag.y = -40 + this.allianceFlagOffsetY;
                  this.allianceFlag.mouseChildren = this.allianceFlag.mouseEnabled = false;
                  this.addChild(this.allianceFlag);
               }
               _loc3_ = !!this.hasAllianceFlag ? param1.guildFlag : param1.enemyFlag;
               this.allianceFlag.change(_loc3_);
            }
            else if(this.allianceFlag)
            {
               this.allianceFlag.Dispose();
               this.removeChild(this.allianceFlag);
               this.allianceFlag = null;
            }
            if(this.hasAllianceIcon && param1.guildFlag)
            {
               if(!this.allianceIcon)
               {
                  this.allianceIcon = new UnionFlagView(true,false);
                  this.allianceIcon.x = -74;
                  this.allianceIcon.y = 46;
                  this.allianceIcon.mouseChildren = this.allianceIcon.mouseEnabled = false;
                  this.addChild(this.allianceIcon);
               }
               this.allianceIcon.change(param1.guildFlag);
            }
            else if(this.allianceIcon)
            {
               this.allianceIcon.Dispose();
               this.removeChild(this.allianceIcon);
               this.allianceIcon = null;
            }
         }
         var _loc2_:Point = new Point(param1.pos.x * MapGlobals.bg.data.xLength,param1.pos.y * MapGlobals.bg.data.yLength);
         _loc2_ = MapGlobals.bg.TileToCoord(_loc2_);
         this.x = _loc2_.x;
         this.y = _loc2_.y;
      }
      
      public function setText(param1:String) : void
      {
         this.txt.text = param1;
         this.back.visible = true;
         this.txt.visible = true;
      }
   }
}
