package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SyncBuildingInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SyncBuildingInfo_SC";
      
      public static const BUILDINGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SyncBuildingInfo_SC.buildingInfo","buildingInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_BuildingInfo);
       
      
      private var buildingInfo$field:Dto_BuildingInfo;
      
      public function Cmd_SyncBuildingInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SyncBuildingInfo_SC.$MessageID;
      }
      
      public function clearBuildingInfo() : void
      {
         this.buildingInfo$field = null;
      }
      
      public function get hasBuildingInfo() : Boolean
      {
         return this.buildingInfo$field != null;
      }
      
      public function set buildingInfo(param1:Dto_BuildingInfo) : void
      {
         this.buildingInfo$field = param1;
      }
      
      public function get buildingInfo() : Dto_BuildingInfo
      {
         return this.buildingInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBuildingInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buildingInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncBuildingInfo_SC.buildingInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.buildingInfo = new Dto_BuildingInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.buildingInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
