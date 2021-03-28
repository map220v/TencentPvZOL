package com.qq.modules.td.model
{
   import com.qq.CommandName;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PData;
   
   public class TDMiniGameMusicData
   {
      
      private static var _instance:TDMiniGameMusicData;
       
      
      private var _combatNum:PData;
      
      private var _totalScore:PData;
      
      public var lastResult:int;
      
      public function TDMiniGameMusicData()
      {
         super();
         this._combatNum = new PData();
         this._totalScore = new PData();
      }
      
      public static function getInstance() : TDMiniGameMusicData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameMusicData();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         this._combatNum.set(0);
         this._totalScore.set(0);
         CommandDispatcher.send(CommandName.TDMiniGame_Music_ChangeScore);
      }
      
      public function get combatNum() : int
      {
         return this._combatNum.get();
      }
      
      public function set combatNum(param1:int) : void
      {
         this._combatNum.set(param1);
      }
      
      public function get totalScore() : int
      {
         return this._totalScore.get();
      }
      
      public function set totalScore(param1:int) : void
      {
         this._totalScore.set(param1);
      }
   }
}
