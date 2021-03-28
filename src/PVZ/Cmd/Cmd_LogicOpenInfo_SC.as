package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT32;
   import flash.utils.IDataInput;
   
   public final class Cmd_LogicOpenInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_LogicOpenInfo_SC";
      
      public static const LOGIC:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_LogicOpenInfo_SC.logic","logic",1 << 3 | WireType.VARINT);
      
      public static const ACTIVE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_LogicOpenInfo_SC.active","active",2 << 3 | WireType.VARINT);
      
      public static const GUIDE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_LogicOpenInfo_SC.Guide","guide",3 << 3 | WireType.VARINT);
       
      
      public var logic:Array;
      
      public var active:Array;
      
      public var guide:Array;
      
      public function Cmd_LogicOpenInfo_SC()
      {
         this.logic = [];
         this.active = [];
         this.guide = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_LogicOpenInfo_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.logic.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.logic[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.active.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.active[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.guide.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT32(param1,this.guide[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT32,this.logic);
                  }
                  else
                  {
                     this.logic.push(ReadUtils.read$TYPE_INT32(param1));
                  }
                  break;
               case 2:
                  if((_loc3_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT32,this.active);
                  }
                  else
                  {
                     this.active.push(ReadUtils.read$TYPE_INT32(param1));
                  }
                  break;
               case 3:
                  if((_loc3_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT32,this.guide);
                  }
                  else
                  {
                     this.guide.push(ReadUtils.read$TYPE_INT32(param1));
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
