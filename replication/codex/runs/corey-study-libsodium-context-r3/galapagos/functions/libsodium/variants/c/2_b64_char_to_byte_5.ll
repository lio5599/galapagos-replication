; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %5
  %or = or i32 %4, %sub3
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  store i32 %not, ptr %upper, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %7
  %or5 = or i32 %6, %sub4
  %shr6 = lshr i32 %or5, 8
  %not7 = xor i32 %shr6, -1
  store i32 %not7, ptr %lower, align 4
  %8 = load i32, ptr %d, align 4
  %9 = load i32, ptr %u, align 4
  %sub8 = sub i32 57, %9
  %or9 = or i32 %8, %sub8
  %shr10 = lshr i32 %or9, 8
  %not11 = xor i32 %shr10, -1
  store i32 %not11, ptr %digit, align 4
  %10 = load i32, ptr %upper, align 4
  %11 = load i32, ptr %a, align 4
  %and = and i32 %10, %11
  %12 = load i32, ptr %lower, align 4
  %13 = load i32, ptr %b, align 4
  %add = add i32 %13, 26
  %and12 = and i32 %12, %add
  %or13 = or i32 %and, %and12
  %14 = load i32, ptr %digit, align 4
  %15 = load i32, ptr %d, align 4
  %add14 = add i32 %15, 52
  %and15 = and i32 %14, %add14
  %or16 = or i32 %or13, %and15
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 62
  %or21 = or i32 %or16, %and20
  %17 = load i32, ptr %u, align 4
  %xor22 = xor i32 %17, 47
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 63
  %or27 = or i32 %or21, %and26
  %and28 = and i32 %or27, 255
  store i32 %and28, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %18, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %19 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %20 = load i32, ptr %u, align 4
  %xor29 = xor i32 %20, 65
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %19, %cond.true ], [ %and32, %cond.false ]
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
