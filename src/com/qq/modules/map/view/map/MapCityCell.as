package com.qq.modules.map.view.map
{
   import asgui.resources.AssetManager;
   import asgui.styles.StyleManager;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.roleInfo.privilege.PrivilegeIcon;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class MapCityCell extends MapBasicCell
   {
       
      
      private var m_privilegeIcon:PrivilegeIcon;
      
      private var iconAvoidWar:Bitmap;
      
      public function MapCityCell()
      {
         super();
         this.hasAllianceIcon = true;
         this.hasAllianceFlagByOther = true;
         this.m_privilegeIcon = PrivilegeIcon.create();
         this.m_privilegeIcon.y = txt.y + 5;
         this.m_privilegeIcon.x = 30;
         this.addChild(this.m_privilegeIcon);
      }
      
      override public function loadVO(param1:MapBasicCellVO) : void
      {
         var _loc3_:uint = 0;
         super.loadVO(param1);
         var _loc2_:MapCityCellVO = param1 as MapCityCellVO;
         var _loc4_:String = "";
         switch(param1.template.id)
         {
            case 1:
               _loc4_ += param1.roleName;
               break;
            case 11:
         }
         setText(_loc4_);
         this.m_privilegeIcon.privilege = _loc2_.privilegeDiamond;
         if(_loc2_.hasWarForbid)
         {
            if(this.iconAvoidWar == null)
            {
               this.iconAvoidWar = new Bitmap(AssetManager.GetNewClass("Map_Cell_AvoidWar_Icon.png") as BitmapData);
               this.iconAvoidWar.x = 66;
               this.iconAvoidWar.y = MapGlobals.bg.data.tileheight - 16;
               this.addChild(this.iconAvoidWar);
            }
         }
         else if(this.iconAvoidWar != null)
         {
            this.removeChild(this.iconAvoidWar);
            this.iconAvoidWar = null;
         }
         if(_loc2_.hasDeclaredWar(MapGlobals.myAllianceId) || _loc2_.isDeclaringWar())
         {
            StyleManager.GetStyleDeclaration(".TXT_Normal_14_ThinBorder").SetTextFieldStyle(txt);
            txt.textColor = 16711680;
         }
         else
         {
            StyleManager.GetStyleDeclaration(".TXT_Normal_14_BrownBorder").SetTextFieldStyle(txt);
            txt.textColor = 16777215;
         }
      }
      
      override public function Dispose() : void
      {
         if(this.m_privilegeIcon)
         {
            this.m_privilegeIcon.Dispose();
         }
         this.m_privilegeIcon = null;
         super.Dispose();
      }
   }
}
