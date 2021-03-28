package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_ENUM;
   import flash.utils.IDataInput;
   
   public final class Cmd_City_GetBuildingEvent_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_GetBuildingEvent_SC";
      
      public static const BUILDINGTYPE:RepeatedFieldDescriptor$TYPE_ENUM = new RepeatedFieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_City_GetBuildingEvent_SC.buildingType","buildingType",1 << 3 | WireType.VARINT,E_City_BuildingType);
       
      
      public var buildingType:Array;
      
      public function Cmd_City_GetBuildingEvent_SC()
      {
         this.buildingType = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_GetBuildingEvent_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.buildingType.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.buildingType[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  if((_loc3_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_ENUM,this.buildingType);
                  }
                  else
                  {
                     this.buildingType.push(ReadUtils.read$TYPE_ENUM(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
