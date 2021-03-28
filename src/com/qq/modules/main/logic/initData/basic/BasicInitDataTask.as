package com.qq.modules.main.logic.initData.basic
{
   import asgui.core.IDisposable;
   import asgui.managers.LoaderManager;
   import com.qq.modules.main.command.GameFlowCmd;
   
   public class BasicInitDataTask implements IDisposable, IInitDataTask
   {
       
      
      public var id:int;
      
      protected var _isFinish:Boolean;
      
      protected var _isRunning:Boolean;
      
      public var isParallel:Boolean;
      
      public function BasicInitDataTask(param1:int, param2:Boolean = true)
      {
         super();
         this.id = param1;
         this.isParallel = param2;
      }
      
      public function Dispose() : void
      {
      }
      
      public function get hasDisposed() : Boolean
      {
         return true;
      }
      
      public function start() : void
      {
         this._isFinish = false;
         this._isRunning = true;
      }
      
      public function get isRunning() : Boolean
      {
         return this._isRunning;
      }
      
      public function get isFinish() : Boolean
      {
         return this._isFinish;
      }
      
      public function finish() : void
      {
         LoaderManager.impl.ClearCache();
         this._isFinish = true;
         this._isRunning = false;
         GameFlowCmd.loadNextFile();
      }
   }
}
