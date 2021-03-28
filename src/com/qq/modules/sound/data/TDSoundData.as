package com.qq.modules.sound.data
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.sound.model.templates.ce.TDSoundSceneTemplateCE;
   import com.qq.utils.DMath;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDSoundData
   {
      
      public static const Sound_ChoosePlant:int = 0;
      
      public static const Sound_Background:int = 1;
      
      public static const Sound_Win:int = 2;
      
      public static const Sound_Lose:int = 3;
      
      public static const Sound_LawnMowerRun:int = 4;
      
      public static const Sound_ZombieAppear:int = 5;
      
      public static const Sound_BigWave:int = 6;
      
      public static const Sound_FinalWave:int = 7;
      
      private static var _instance:TDSoundData;
       
      
      private var _soundList:Array;
      
      public function TDSoundData()
      {
         super();
         this._soundList = new Array();
      }
      
      public static function getInstance() : TDSoundData
      {
         if(_instance == null)
         {
            _instance = new TDSoundData();
         }
         return _instance;
      }
      
      public function reset(param1:int) : void
      {
         var _loc2_:TDSoundSceneTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDSoundSceneInfo,param1,TDSoundSceneTemplateCE);
         if(_loc2_ != null)
         {
            this.setSoundID(Sound_ChoosePlant,_loc2_.choosePlantSoundID);
            this.setSoundID(Sound_Background,_loc2_.backgroundSoundID);
            this.setSoundID(Sound_Win,_loc2_.winSoundID);
            this.setSoundID(Sound_Lose,_loc2_.loseoundID);
            this.setSoundID(Sound_LawnMowerRun,_loc2_.lawnMowerID);
            this.setSoundList(Sound_ZombieAppear,_loc2_.zombieAppearList);
         }
      }
      
      private function setSoundID(param1:int, param2:int) : void
      {
         this._soundList[param1] = [param2];
      }
      
      private function setSoundList(param1:int, param2:String) : void
      {
         var _loc3_:Array = new Array();
         if(param2.length > 0)
         {
            _loc3_ = param2.split(":");
         }
         this._soundList[param1] = _loc3_;
      }
      
      public function getSoundID(param1:int) : int
      {
         var _loc3_:int = 0;
         if(this._soundList[param1] == null)
         {
            return 0;
         }
         var _loc2_:Array = this._soundList[param1];
         if(_loc2_.length > 0)
         {
            if(_loc2_.length == 1)
            {
               return _loc2_[0];
            }
            _loc3_ = DMath.randNum(0,_loc2_.length - 1);
            return _loc2_[_loc3_];
         }
         return 0;
      }
   }
}
