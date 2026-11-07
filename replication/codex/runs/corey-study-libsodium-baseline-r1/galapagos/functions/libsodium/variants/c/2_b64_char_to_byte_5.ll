; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
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
  %rejected_upper = alloca i32, align 4
  %rejected_lower = alloca i32, align 4
  %rejected_digit = alloca i32, align 4
  %rejected_plus = alloca i32, align 4
  %rejected_slash = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %or = or i32 %shr, %shr2
  %and = and i32 %or, 255
  store i32 %and, ptr %rejected_upper, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %shr4 = lshr i32 %sub3, 8
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %4
  %shr6 = lshr i32 %sub5, 8
  %or7 = or i32 %shr4, %shr6
  %and8 = and i32 %or7, 255
  store i32 %and8, ptr %rejected_lower, align 4
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %shr10 = lshr i32 %sub9, 8
  %6 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %6
  %shr12 = lshr i32 %sub11, 8
  %or13 = or i32 %shr10, %shr12
  %and14 = and i32 %or13, 255
  store i32 %and14, ptr %rejected_digit, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub15 = sub i32 0, %xor
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  store i32 %and17, ptr %rejected_plus, align 4
  %8 = load i32, ptr %u, align 4
  %xor18 = xor i32 %8, 47
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  store i32 %and21, ptr %rejected_slash, align 4
  %9 = load i32, ptr %rejected_upper, align 4
  %sub22 = sub i32 255, %9
  %10 = load i32, ptr %u, align 4
  %sub23 = sub i32 %10, 65
  %and24 = and i32 %sub22, %sub23
  %11 = load i32, ptr %rejected_lower, align 4
  %sub25 = sub i32 255, %11
  %12 = load i32, ptr %u, align 4
  %sub26 = sub i32 %12, 97
  %add = add i32 %sub26, 26
  %and27 = and i32 %sub25, %add
  %or28 = or i32 %and24, %and27
  %13 = load i32, ptr %rejected_digit, align 4
  %sub29 = sub i32 255, %13
  %14 = load i32, ptr %u, align 4
  %sub30 = sub i32 %14, 48
  %add31 = add i32 %sub30, 52
  %and32 = and i32 %sub29, %add31
  %or33 = or i32 %or28, %and32
  %15 = load i32, ptr %rejected_plus, align 4
  %sub34 = sub i32 255, %15
  %and35 = and i32 %sub34, 62
  %or36 = or i32 %or33, %and35
  %16 = load i32, ptr %rejected_slash, align 4
  %sub37 = sub i32 255, %16
  %and38 = and i32 %sub37, 63
  %or39 = or i32 %or36, %and38
  store i32 %or39, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor40 = xor i32 %19, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %and43, %cond.false ]
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
