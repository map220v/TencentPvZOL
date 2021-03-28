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
   
   public final class Cmd_Arena_GetTopPlayers_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Arena_GetTopPlayers_SC";
      
      public static const GRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetTopPlayers_SC.grade","grade",1 << 3 | WireType.VARINT);
      
      public static const PLAYERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Arena_GetTopPlayers_SC.players","players",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ArenaTopPlayer);
       
      
      private var grade$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var players:Array;
      
      public function Cmd_Arena_GetTopPlayers_SC()
      {
         this.players = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Arena_GetTopPlayers_SC.$MessageID;
      }
      
      public function clearGrade() : void
      {
         this.hasField$0 &= 4294967294;
         this.grade$field = new uint();
      }
      
      public function get hasGrade() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set grade(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.grade$field = param1;
      }
      
      public function get grade() : uint
      {
         return this.grade$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasGrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.grade$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.players.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.players[_loc2_]);
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
                     throw new IOError("Bad data format: Cmd_Arena_GetTopPlayers_SC.grade cannot be set twice.");
                  }
                  _loc3_++;
                  this.grade = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.players.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ArenaTopPlayer()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
