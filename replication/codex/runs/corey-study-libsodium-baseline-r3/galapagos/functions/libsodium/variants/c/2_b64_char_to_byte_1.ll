; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
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
  store i32 0, ptr %x, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %6
  %or = or i32 %5, %sub3
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %4, %not
  %and4 = and i32 %and, 255
  %7 = load i32, ptr %x, align 4
  %or5 = or i32 %7, %and4
  store i32 %or5, ptr %x, align 4
  %8 = load i32, ptr %b, align 4
  %add = add i32 %8, 26
  %9 = load i32, ptr %b, align 4
  %10 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %10
  %or7 = or i32 %9, %sub6
  %shr8 = lshr i32 %or7, 8
  %not9 = xor i32 %shr8, -1
  %and10 = and i32 %add, %not9
  %and11 = and i32 %and10, 255
  %11 = load i32, ptr %x, align 4
  %or12 = or i32 %11, %and11
  store i32 %or12, ptr %x, align 4
  %12 = load i32, ptr %d, align 4
  %add13 = add i32 %12, 52
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %14
  %or15 = or i32 %13, %sub14
  %shr16 = lshr i32 %or15, 8
  %not17 = xor i32 %shr16, -1
  %and18 = and i32 %add13, %not17
  %and19 = and i32 %and18, 255
  %15 = load i32, ptr %x, align 4
  %or20 = or i32 %15, %and19
  store i32 %or20, ptr %x, align 4
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %and24 = and i32 62, %not23
  %17 = load i32, ptr %x, align 4
  %or25 = or i32 %17, %and24
  store i32 %or25, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor26 = xor i32 %18, 47
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %not29 = xor i32 %shr28, -1
  %and30 = and i32 63, %not29
  %19 = load i32, ptr %x, align 4
  %or31 = or i32 %19, %and30
  store i32 %or31, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %cmp = icmp ne i32 %20, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %21 = load i32, ptr %x, align 4
  store i32 %21, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %22 = load i32, ptr %u, align 4
  %xor32 = xor i32 %22, 65
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  store i32 %and35, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %23 = load i32, ptr %retval, align 4
  ret i32 %23
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
