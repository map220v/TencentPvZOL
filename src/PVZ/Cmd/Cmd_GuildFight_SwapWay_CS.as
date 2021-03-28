package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_SwapWay_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_SwapWay_CS";
      
      public static const WAY1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SwapWay_CS.way1","way1",1 << 3 | WireType.VARINT);
      
      public static const WAY2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SwapWay_CS.way2","way2",2 << 3 | WireType.VARINT);
       
      
      private var way1$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var way2$field:uint;
      
      public function Cmd_GuildFight_SwapWay_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_SwapWay_CS.$MessageID;
      }
      
      public function clearWay1() : void
      {
         this.hasField$0 &= 4294967294;
         this.way1$field = new uint();
      }
      
      public function get hasWay1() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set way1(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.way1$field = param1;
      }
      
      public function get way1() : uint
      {
         return this.way1$field;
      }
      
      public function clearWay2() : void
      {
         this.hasField$0 &= 4294967293;
         this.way2$field = new uint();
      }
      
      public function get hasWay2() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set way2(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.way2$field = param1;
      }
      
      public function get way2() : uint
      {
         return this.way2$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasWay1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.way1$field);
         }
         if(this.hasWay2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.way2$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SwapWay_CS.way1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.way1 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SwapWay_CS.way2 cannot be set twice.");
                  }
                  _loc4_++;
                  this.way2 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
