; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %retval = alloca i32, align 4
  %a_val.addr = alloca i8, align 1
  %seg = alloca i32, align 4
  %mant = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 4
  %xor = xor i32 %shr, 5
  %and = and i32 %xor, 7
  store i32 %and, ptr %seg, align 4
  %1 = load i8, ptr %a_val.addr, align 1
  %conv1 = zext i8 %1 to i32
  %xor2 = xor i32 %conv1, 5
  %and3 = and i32 %xor2, 15
  store i32 %and3, ptr %mant, align 4
  %2 = load i32, ptr %mant, align 4
  %shl = shl i32 %2, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %t, align 4
  %3 = load i32, ptr %seg, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %add5 = add nsw i32 %4, 256
  %5 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %5, 1
  %shl6 = shl i32 %add5, %sub
  store i32 %shl6, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i8, ptr %a_val.addr, align 1
  %conv7 = zext i8 %6 to i32
  %and8 = and i32 %conv7, 128
  %tobool = icmp ne i32 %and8, 0
  br i1 %tobool, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  %7 = load i32, ptr %t, align 4
  store i32 %7, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  %8 = load i32, ptr %t, align 4
  %sub11 = sub nsw i32 0, %8
  store i32 %sub11, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then9
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
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
