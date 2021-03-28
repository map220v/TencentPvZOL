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
   
   public final class Cmd_City_MergeServerFlag_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_MergeServerFlag_SC";
      
      public static const IEXILE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_MergeServerFlag_SC.iExile","iExile",1 << 3 | WireType.VARINT);
      
      public static const IROLENAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_MergeServerFlag_SC.iRoleName","iRoleName",2 << 3 | WireType.VARINT);
      
      public static const IGUILDNAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_MergeServerFlag_SC.iGuildName","iGuildName",3 << 3 | WireType.VARINT);
       
      
      private var iExile$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iRoleName$field:uint;
      
      private var iGuildName$field:uint;
      
      public function Cmd_City_MergeServerFlag_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_MergeServerFlag_SC.$MessageID;
      }
      
      public function clearIExile() : void
      {
         this.hasField$0 &= 4294967294;
         this.iExile$field = new uint();
      }
      
      public function get hasIExile() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iExile(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iExile$field = param1;
      }
      
      public function get iExile() : uint
      {
         return this.iExile$field;
      }
      
      public function clearIRoleName() : void
      {
         this.hasField$0 &= 4294967293;
         this.iRoleName$field = new uint();
      }
      
      public function get hasIRoleName() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iRoleName(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iRoleName$field = param1;
      }
      
      public function get iRoleName() : uint
      {
         return this.iRoleName$field;
      }
      
      public function clearIGuildName() : void
      {
         this.hasField$0 &= 4294967291;
         this.iGuildName$field = new uint();
      }
      
      public function get hasIGuildName() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set iGuildName(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.iGuildName$field = param1;
      }
      
      public function get iGuildName() : uint
      {
         return this.iGuildName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIExile)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.iExile$field);
         }
         if(this.hasIRoleName)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iRoleName$field);
         }
         if(this.hasIGuildName)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.iGuildName$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_MergeServerFlag_SC.iExile cannot be set twice.");
                  }
                  _loc3_++;
                  this.iExile = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_MergeServerFlag_SC.iRoleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.iRoleName = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_MergeServerFlag_SC.iGuildName cannot be set twice.");
                  }
                  _loc5_++;
                  this.iGuildName = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
