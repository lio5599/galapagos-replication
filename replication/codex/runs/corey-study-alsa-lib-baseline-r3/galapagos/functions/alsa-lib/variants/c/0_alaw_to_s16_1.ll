; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_1.c"
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
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = lshr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %x, align 4
  %and1 = and i32 %2, 15
  %mul = mul i32 %and1, 16
  %add = add i32 %mul, 8
  store i32 %add, ptr %t, align 4
  %3 = load i32, ptr %seg, align 4
  switch i32 %3, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
    i32 3, label %sw.bb7
    i32 4, label %sw.bb10
    i32 5, label %sw.bb13
    i32 6, label %sw.bb16
    i32 7, label %sw.bb19
  ]

sw.bb:                                            ; preds = %entry
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %add3 = add nsw i32 %4, 256
  store i32 %add3, ptr %t, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %5 = load i32, ptr %t, align 4
  %add5 = add nsw i32 %5, 256
  %mul6 = mul nsw i32 %add5, 2
  store i32 %mul6, ptr %t, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %6 = load i32, ptr %t, align 4
  %add8 = add nsw i32 %6, 256
  %mul9 = mul nsw i32 %add8, 4
  store i32 %mul9, ptr %t, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %7 = load i32, ptr %t, align 4
  %add11 = add nsw i32 %7, 256
  %mul12 = mul nsw i32 %add11, 8
  store i32 %mul12, ptr %t, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %8 = load i32, ptr %t, align 4
  %add14 = add nsw i32 %8, 256
  %mul15 = mul nsw i32 %add14, 16
  store i32 %mul15, ptr %t, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %entry
  %9 = load i32, ptr %t, align 4
  %add17 = add nsw i32 %9, 256
  %mul18 = mul nsw i32 %add17, 32
  store i32 %mul18, ptr %t, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %10 = load i32, ptr %t, align 4
  %add20 = add nsw i32 %10, 256
  %mul21 = mul nsw i32 %add20, 64
  store i32 %mul21, ptr %t, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb19, %sw.bb16, %sw.bb13, %sw.bb10, %sw.bb7, %sw.bb4, %sw.bb2, %sw.bb, %entry
  %11 = load i32, ptr %x, align 4
  %and22 = and i32 %11, 128
  %tobool = icmp ne i32 %and22, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.epilog
  %12 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %sw.epilog
  %13 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ %sub, %cond.false ]
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
