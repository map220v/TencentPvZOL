package com.qq.modules.td.logic.action.object.torch
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class TorchActionBoom extends BasicAction
   {
       
      
      public function TorchActionBoom()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         TDGameObjectCmd.addNormalGameObjectByTile(_gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_LootItemType),_loc2_);
         _gameObject.Dispose();
      }
   }
}
