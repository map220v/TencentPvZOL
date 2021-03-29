package com.qq.modules.levelselect.view.maps
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.utils.QDisplayUtil;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class LSFlySun extends Sprite
   {
      
      private static const iconXpath:Array = ["application/uiLayer/ModuleRoleInfo/RoleInfoPanel/hbox/RoleSunBar/Role_sunBar/mcHolder/icon","application/uiLayer/ModuleRoleInfo/RoleInfoPanel/hbox/RoleExpBar/Role_expBar/mcHolder/icon","application/uiLayer/ModuleRoleInfo/RoleInfoPanel/hbox/RoleCoinBar/Role_coinBar/mcHolder/icon"];
      
      public static const TYPE_SUN:int = 0;
      
      public static const TYPE_EXP:int = 1;
      
      public static const TYPE_COIN:int = 2;
       
      
      private var anim:BlitBoneAnim;
      
      public var toTarget:Point;
      
      private var addValue:int;
      
      private var type:int;
      
      public function LSFlySun(param1:int, param2:int)
      {
         var _loc3_:TDNormalObjectStaticInfo = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Image = null;
         this.toTarget = new Point(253,26);
         super();
         this.type = param1;
         this.addValue = param2;
         if(param1 == TYPE_SUN)
         {
            this.anim = BlitBoneManager.impl.createBoneAnim();
            _loc3_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,100,TDNormalObjectStaticInfo);
            this.anim.data = BlitBoneManager.impl.getBoneDataByUrl(UrlManager.getUrl(UrlManager.Url_TDObjectAnmi,_loc3_.resFileName + ".bbone"));
            this.anim.gotoAndPlay("animation",0);
            this.addChild(this.anim.asset.asset);
         }
         else if(param1 == TYPE_EXP)
         {
            _loc4_ = AssetManager.GetNewClass("ModuleRoleInfo_ExpBar") as DisplayObject;
            this.addChild(_loc4_);
         }
         else if(param1 == TYPE_COIN)
         {
            (_loc5_ = new Image()).source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"1.png");
            this.addChild(_loc5_);
         }
      }
      
      public function pop(param1:Number) : void
      {
         this.$pop(param1);
      }
      
      public function $pop(param1:Number) : void
      {
         var _loc2_:Point = Point.polar(100,param1 * Math.PI + Math.PI);
         _loc2_ = _loc2_.add(new Point(this.x,this.y));
         TweenMax.allTo([this],0.3 + 0.6 * Math.random(),{
            "x":_loc2_.x,
            "y":_loc2_.y
         },0,this.onPopEnd);
      }
      
      private function onPopEnd() : void
      {
         var _loc1_:String = iconXpath[this.type];
         var _loc2_:DisplayObject = QDisplayUtil.CodeToDisplay(_loc1_,false);
         if(_loc2_)
         {
            this.toTarget = _loc2_.localToGlobal(new Point());
         }
         else
         {
            this.toTarget = new Point(0,0);
         }
         TweenMax.allTo([this],0.2 + 2 * Math.random(),{
            "x":this.toTarget.x,
            "y":this.toTarget.y
         },0,this.onFlyEnd);
      }
      
      private function onFlyEnd() : void
      {
         TweenMax.allTo([this],0.2,{
            "scaleX":0,
            "scaleY":0
         },0,this.onSizeEnd);
      }
      
      private function onSizeEnd() : void
      {
         switch(this.type)
         {
            case TYPE_SUN:
               RoleInfoCmd.addRoleSunDelay(-this.addValue);
               break;
            case TYPE_EXP:
               RoleInfoCmd.addRoleExpDelay(-this.addValue);
         }
         this.Dispose();
      }
      
      public function Dispose() : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         if(this.anim)
         {
            this.anim.Dispose();
            this.anim = null;
         }
      }
   }
}
