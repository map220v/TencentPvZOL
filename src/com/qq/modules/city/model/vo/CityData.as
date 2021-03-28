package com.qq.modules.city.model.vo
{
   import PVZ.Cmd.Cmd_City_GetBuildingInfo_SC;
   import PVZ.Cmd.Dto_BuildingInfo;
   import com.qq.GameGloble;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.modules.guide.model.templates.GuideTemplateFactory;
   import com.qq.modules.guide.model.templates.ce.OpenButtonInfoTemplateCE;
   
   public class CityData
   {
       
      
      public var coinCanProduct:uint;
      
      public var canCollect:Boolean;
      
      public var lastCollectTime:Number;
      
      public var buildingList:Array;
      
      public var newBuildingList:Array;
      
      public var buttonList:Array;
      
      public function CityData()
      {
         super();
         this.buildingList = new Array();
         this.newBuildingList = new Array();
         this.buttonList = new Array();
      }
      
      public function initToolBarButton() : void
      {
         var _loc2_:OpenButtonInfoTemplateCE = null;
         this.addButton(CityButtonConstant.Name_TD);
         this.addButton(CityButtonConstant.Name_MAIL);
         this.addButton(CityButtonConstant.Name_Bag);
         this.addButton(CityButtonConstant.Name_Friend);
         var _loc1_:Array = GuideTemplateFactory.instance.getOpenButtonListByCheckPanelName("NewCityToolBar");
         for each(_loc2_ in _loc1_)
         {
            /*if(!GameGloble.actorModel.checkIfOpenDaySatisfied(_loc2_.openDays,_loc2_.openLv))
            {
               continue;
            }*/
            switch(_loc2_.id)
            {
               case CityButtonConstant.ID_BUTTON_QUEST:
                  this.addButton(CityButtonConstant.Name_Quest);
                  break;
               case CityButtonConstant.ID_BUTTON_FUBEN:
                  this.addButton(CityButtonConstant.Name_Fuben);
                  break;
               case CityButtonConstant.ID_BUTTON_WORLD_MAP:
                  this.addButton(CityButtonConstant.Name_WorldMap);
                  break;
               case CityButtonConstant.ID_BUTTON_SHOP:
                  this.addButton(CityButtonConstant.Name_Shop);
                  break;
               case CityButtonConstant.ID_BUTTON_Illustrations:
                  this.addButton(CityButtonConstant.Name_Illustrations);
                  break;
               case CityButtonConstant.ID_BUTTON_Dummy:
                  this.addButton(CityButtonConstant.Name_Dummy);
                  break;
            }
         }
      }
      
      public function addButton(param1:String) : void
      {
         var _loc2_:int = this.buttonList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this.buttonList.push(param1);
         }
      }
      
      public function addNewBuilding(param1:int) : void
      {
         this.newBuildingList.push(param1);
      }
      
      public function addBuilding(param1:int) : void
      {
         var _loc2_:int = this.buildingList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this.buildingList.push(param1);
         }
      }
      
      public function hasBuilding(param1:int) : Boolean
      {
         return this.buildingList.indexOf(param1) >= 0;
      }
      
      public function loadCityInfo(param1:Cmd_City_GetBuildingInfo_SC) : Array
      {
         var _loc3_:Dto_BuildingInfo = null;
         var _loc2_:Array = param1.buildingInfo;
         for each(_loc3_ in _loc2_)
         {
            this.addBuilding(_loc3_.buildingType);
         }
         return this.buildingList;
      }
   }
}
