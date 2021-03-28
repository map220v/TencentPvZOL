package tencent.io.service.events
{
   import flash.events.Event;
   import org.robotlegs.utilities.modular.base.IModuleEvent;
   
   public class SocketServiceEvent extends Event implements IModuleEvent
   {
      
      public static const SOCKET_STATE_CHANGE:String = "SOCKET_STATE_CHANGE";
      
      public static const SOCKET_DATA_UPDATE:String = "SOCKET_DATA_UPDATE";
       
      
      private var _socketData:Object;
      
      private var _socketDataCmdName:String;
      
      private var _retCode:int;
      
      private var _socketStateType:uint;
      
      public function SocketServiceEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set retCode(param1:int) : void
      {
         this._retCode = param1;
      }
      
      public function get retCode() : int
      {
         return this._retCode;
      }
      
      public function set socketStateType(param1:uint) : void
      {
         this._socketStateType = param1;
      }
      
      public function get socketStateType() : uint
      {
         return this._socketStateType;
      }
      
      public function set socketData(param1:Object) : void
      {
         this._socketData = param1;
      }
      
      public function get socketData() : Object
      {
         return this._socketData;
      }
      
      public function get socketDataCmdName() : String
      {
         return this._socketDataCmdName;
      }
      
      public function set socketDataCmdName(param1:String) : void
      {
         this._socketDataCmdName = param1;
      }
   }
}
