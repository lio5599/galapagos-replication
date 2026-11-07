; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  store i32 %sub1, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 62
  store i32 %sub2, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub3 = sub i32 0, %xor
  store i32 %sub3, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor4 = xor i32 %4, 63
  %sub5 = sub i32 0, %xor4
  store i32 %sub5, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %shl = shl i32 %add, 8
  %and = and i32 %5, %shl
  %7 = load i32, ptr %a, align 4
  %not = xor i32 %7, -1
  %8 = load i32, ptr %b, align 4
  %and6 = and i32 %not, %8
  %9 = load i32, ptr %x.addr, align 4
  %add7 = add i32 %9, 71
  %shl8 = shl i32 %add7, 8
  %and9 = and i32 %and6, %shl8
  %or = or i32 %and, %and9
  %10 = load i32, ptr %b, align 4
  %not10 = xor i32 %10, -1
  %11 = load i32, ptr %c, align 4
  %and11 = and i32 %not10, %11
  %12 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %12, -4
  %shl13 = shl i32 %add12, 8
  %and14 = and i32 %and11, %shl13
  %or15 = or i32 %or, %and14
  %13 = load i32, ptr %d, align 4
  %not16 = xor i32 %13, -1
  %and17 = and i32 %not16, 11520
  %or18 = or i32 %or15, %and17
  %14 = load i32, ptr %e, align 4
  %not19 = xor i32 %14, -1
  %and20 = and i32 %not19, 24320
  %or21 = or i32 %or18, %and20
  store i32 %or21, ptr %result, align 4
  %15 = load i32, ptr %result, align 4
  %shr = lshr i32 %15, 8
  %and22 = and i32 %shr, 255
  ret i32 %and22
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
