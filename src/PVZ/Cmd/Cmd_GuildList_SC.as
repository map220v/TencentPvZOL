package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildList_SC";
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildList_SC.count","count",1 << 3 | WireType.VARINT);
      
      public static const GUILDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildList_SC.guildList","guildList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_BaseInfo);
       
      
      private var count$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var guildList:Array;
      
      public function Cmd_GuildList_SC()
      {
         this.guildList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildList_SC.$MessageID;
      }
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.guildList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_GuildList_SC.count cannot be set twice.");
                  }
                  _loc3_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.guildList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guild_BaseInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
