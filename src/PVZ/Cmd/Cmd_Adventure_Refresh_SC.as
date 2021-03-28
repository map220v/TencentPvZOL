package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.utils.IDataInput;
   
   public final class Cmd_Adventure_Refresh_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Adventure_Refresh_SC";
      
      public static const PLACES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Refresh_SC.places","places",1 << 3 | WireType.VARINT);
       
      
      public var places:Array;
      
      public function Cmd_Adventure_Refresh_SC()
      {
         this.places = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Adventure_Refresh_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.places.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.places[_loc2_]);
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
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.places);
                  }
                  else
                  {
                     this.places.push(ReadUtils.read$TYPE_UINT32(param1));
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
