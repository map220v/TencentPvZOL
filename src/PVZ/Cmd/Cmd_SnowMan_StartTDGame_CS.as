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
   
   public final class Cmd_SnowMan_StartTDGame_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SnowMan_StartTDGame_CS";
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_StartTDGame_CS.modeId","modeId",1 << 3 | WireType.VARINT);
      
      public static const FOUNTAINID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_StartTDGame_CS.fountainId","fountainId",2 << 3 | WireType.VARINT);
       
      
      private var modeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var fountainId$field:uint;
      
      public function Cmd_SnowMan_StartTDGame_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SnowMan_StartTDGame_CS.$MessageID;
      }
      
      public function clearModeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.modeId$field = new uint();
      }
      
      public function get hasModeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set modeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.modeId$field = param1;
      }
      
      public function get modeId() : uint
      {
         return this.modeId$field;
      }
      
      public function clearFountainId() : void
      {
         this.hasField$0 &= 4294967293;
         this.fountainId$field = new uint();
      }
      
      public function get hasFountainId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set fountainId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.fountainId$field = param1;
      }
      
      public function get fountainId() : uint
      {
         return this.fountainId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.modeId$field);
         }
         if(this.hasFountainId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.fountainId$field);
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
                     throw new IOError("Bad data format: Cmd_SnowMan_StartTDGame_CS.modeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_StartTDGame_CS.fountainId cannot be set twice.");
                  }
                  _loc4_++;
                  this.fountainId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
