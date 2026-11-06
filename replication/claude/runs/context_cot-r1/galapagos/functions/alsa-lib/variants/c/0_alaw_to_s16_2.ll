; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_2.c"
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
  %a_val.addr = alloca i8, align 1
  %v = alloca i32, align 4
  %m = alloca i32, align 4
  %base = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %and = and i32 %xor, 255
  store i32 %and, ptr %v, align 4
  %1 = load i32, ptr %v, align 4
  %and1 = and i32 %1, 15
  store i32 %and1, ptr %m, align 4
  %2 = load i32, ptr %m, align 4
  %shl = shl i32 %2, 4
  %add = add nsw i32 %shl, 264
  store i32 %add, ptr %base, align 4
  %3 = load i32, ptr %v, align 4
  %shr = ashr i32 %3, 4
  %and2 = and i32 %shr, 7
  switch i32 %and2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb5
    i32 2, label %sw.bb6
    i32 3, label %sw.bb8
    i32 4, label %sw.bb10
    i32 5, label %sw.bb12
    i32 6, label %sw.bb14
  ]

sw.bb:                                            ; preds = %entry
  %4 = load i32, ptr %m, align 4
  %shl3 = shl i32 %4, 4
  %add4 = add nsw i32 %shl3, 8
  store i32 %add4, ptr %t, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %5 = load i32, ptr %base, align 4
  store i32 %5, ptr %t, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  %6 = load i32, ptr %base, align 4
  %shl7 = shl i32 %6, 1
  store i32 %shl7, ptr %t, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %7 = load i32, ptr %base, align 4
  %shl9 = shl i32 %7, 2
  store i32 %shl9, ptr %t, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %8 = load i32, ptr %base, align 4
  %shl11 = shl i32 %8, 3
  store i32 %shl11, ptr %t, align 4
  br label %sw.epilog

sw.bb12:                                          ; preds = %entry
  %9 = load i32, ptr %base, align 4
  %shl13 = shl i32 %9, 4
  store i32 %shl13, ptr %t, align 4
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %10 = load i32, ptr %base, align 4
  %shl15 = shl i32 %10, 5
  store i32 %shl15, ptr %t, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %11 = load i32, ptr %base, align 4
  %shl16 = shl i32 %11, 6
  store i32 %shl16, ptr %t, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb14, %sw.bb12, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb5, %sw.bb
  %12 = load i32, ptr %v, align 4
  %and17 = and i32 %12, 128
  %tobool = icmp ne i32 %and17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.epilog
  %13 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %sw.epilog
  %14 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %sub, %cond.false ]
  ret i32 %cond
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
