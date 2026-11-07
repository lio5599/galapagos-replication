; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %not = xor i32 %shr, -1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %not3 = xor i32 %shr2, -1
  %and = and i32 %not, %not3
  %and4 = and i32 %and, 255
  store i32 %and4, ptr %upper, align 4
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 97
  %shr6 = lshr i32 %sub5, 8
  %not7 = xor i32 %shr6, -1
  %4 = load i32, ptr %u, align 4
  %sub8 = sub i32 122, %4
  %shr9 = lshr i32 %sub8, 8
  %not10 = xor i32 %shr9, -1
  %and11 = and i32 %not7, %not10
  %and12 = and i32 %and11, 255
  store i32 %and12, ptr %lower, align 4
  %5 = load i32, ptr %u, align 4
  %sub13 = sub i32 %5, 48
  %shr14 = lshr i32 %sub13, 8
  %not15 = xor i32 %shr14, -1
  %6 = load i32, ptr %u, align 4
  %sub16 = sub i32 57, %6
  %shr17 = lshr i32 %sub16, 8
  %not18 = xor i32 %shr17, -1
  %and19 = and i32 %not15, %not18
  %and20 = and i32 %and19, 255
  store i32 %and20, ptr %digit, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %and24 = and i32 %not23, 255
  store i32 %and24, ptr %plus, align 4
  %8 = load i32, ptr %u, align 4
  %xor25 = xor i32 %8, 47
  %sub26 = sub i32 0, %xor25
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 %not28, 255
  store i32 %and29, ptr %slash, align 4
  %9 = load i32, ptr %upper, align 4
  %10 = load i32, ptr %u, align 4
  %sub30 = sub i32 %10, 65
  %and31 = and i32 %9, %sub30
  %11 = load i32, ptr %lower, align 4
  %12 = load i32, ptr %u, align 4
  %sub32 = sub i32 %12, 97
  %add = add i32 %sub32, 26
  %and33 = and i32 %11, %add
  %or = or i32 %and31, %and33
  %13 = load i32, ptr %digit, align 4
  %14 = load i32, ptr %u, align 4
  %sub34 = sub i32 %14, 48
  %add35 = add i32 %sub34, 52
  %and36 = and i32 %13, %add35
  %or37 = or i32 %or, %and36
  %15 = load i32, ptr %plus, align 4
  %and38 = and i32 %15, 62
  %or39 = or i32 %or37, %and38
  %16 = load i32, ptr %slash, align 4
  %and40 = and i32 %16, 63
  %or41 = or i32 %or39, %and40
  store i32 %or41, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor42 = xor i32 %19, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %shr44, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %and45, %cond.false ]
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
