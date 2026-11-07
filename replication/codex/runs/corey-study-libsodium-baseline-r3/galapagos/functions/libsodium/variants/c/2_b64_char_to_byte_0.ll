; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %xor4 = xor i32 255, %and3
  %and5 = and i32 %xor, %xor4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 65
  %and7 = and i32 %and5, %sub6
  %4 = load i32, ptr %u, align 4
  %sub8 = sub i32 %4, 97
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  %xor11 = xor i32 255, %and10
  %5 = load i32, ptr %u, align 4
  %sub12 = sub i32 122, %5
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 255, %and14
  %and16 = and i32 %xor11, %xor15
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 %6, 71
  %and18 = and i32 %and16, %sub17
  %or = or i32 %and7, %and18
  %7 = load i32, ptr %u, align 4
  %sub19 = sub i32 %7, 48
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor22 = xor i32 255, %and21
  %8 = load i32, ptr %u, align 4
  %sub23 = sub i32 57, %8
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 255
  %xor26 = xor i32 255, %and25
  %and27 = and i32 %xor22, %xor26
  %9 = load i32, ptr %u, align 4
  %sub28 = sub i32 %9, -4
  %and29 = and i32 %and27, %sub28
  %or30 = or i32 %or, %and29
  %10 = load i32, ptr %u, align 4
  %xor31 = xor i32 %10, 43
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 %shr33, 255
  %xor35 = xor i32 255, %and34
  %and36 = and i32 %xor35, 62
  %or37 = or i32 %or30, %and36
  %11 = load i32, ptr %u, align 4
  %xor38 = xor i32 %11, 47
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %xor42 = xor i32 255, %and41
  %and43 = and i32 %xor42, 63
  %or44 = or i32 %or37, %and43
  store i32 %or44, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %13 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %14 = load i32, ptr %u, align 4
  %xor45 = xor i32 %14, 65
  %sub46 = sub i32 0, %xor45
  %shr47 = lshr i32 %sub46, 8
  %and48 = and i32 %shr47, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %and48, %cond.false ]
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
