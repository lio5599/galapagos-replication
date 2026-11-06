; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.t = internal constant [80 x i8] c">\FF\FF\FF?456789:;<=\FF\FF\FF\FF\FF\FF\FF\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\FF\FF\FF\FF\FF\FF\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %sub = sub i32 %1, 43
  %cmp = icmp ult i32 %sub, 80
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %w, align 4
  %sub1 = sub i32 %2, 43
  %idxprom = zext i32 %sub1 to i64
  %arrayidx = getelementptr inbounds [80 x i8], ptr @b64_char_to_byte.t, i64 0, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %3 to i32
  store i32 %conv, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, ptr %w, align 4
  %cmp2 = icmp uge i32 %4, 65280
  br i1 %cmp2, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.end
  %5 = load i32, ptr %w, align 4
  %cmp5 = icmp eq i32 %5, 65327
  %conv6 = zext i1 %cmp5 to i32
  %sub7 = sub i32 63, %conv6
  store i32 %sub7, ptr %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  store i32 255, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then4, %if.then
  %6 = load i32, ptr %retval, align 4
  ret i32 %6
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
