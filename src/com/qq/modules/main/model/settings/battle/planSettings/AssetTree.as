package com.qq.modules.main.model.settings.battle.planSettings
{
   import com.qq.GameGloble;
   
   public class AssetTree
   {
       
      
      public var assetBulletList:Array;
      
      public var assetEffectList:Array;
      
      public var unitAssetName:String;
      
      public var rightSideMirror:int;
      
      public function AssetTree(param1:XML)
      {
         var _loc2_:String = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         super();
         if(param1.hasComplexContent())
         {
            this.unitAssetName = String(param1.assetUnit[0].@assetName) + GameGloble.BONE_FILE_EXT_POINT;
            this.rightSideMirror = param1.assetUnit[0].@rightSideMirror;
            this.assetBulletList = [];
            for each(_loc3_ in param1..assetBullet)
            {
               _loc2_ = String(_loc3_.@assetName);
               _loc2_ += GameGloble.BONE_FILE_EXT_POINT;
               this.assetBulletList.push(_loc2_);
            }
            this.assetEffectList = [];
            for each(_loc4_ in param1..assetEffect)
            {
               _loc2_ = String(_loc4_.@assetName);
               _loc2_ += GameGloble.BONE_FILE_EXT_POINT;
               this.assetEffectList.push(_loc2_);
            }
         }
      }
   }
}
