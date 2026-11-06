; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
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
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %div = udiv i32 %0, 26
  switch i32 %div, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32, ptr %x.addr, align 4
  %add = add i32 %1, 65
  store i32 %add, ptr %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry
  %2 = load i32, ptr %x.addr, align 4
  %add2 = add i32 %2, 71
  store i32 %add2, ptr %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %entry
  %3 = load i32, ptr %x.addr, align 4
  %cmp = icmp ult i32 %3, 62
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb3
  %4 = load i32, ptr %x.addr, align 4
  %add4 = add i32 %4, -4
  store i32 %add4, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb3
  %5 = load i32, ptr %x.addr, align 4
  %cmp5 = icmp eq i32 %5, 62
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 45, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %6 = load i32, ptr %x.addr, align 4
  %cmp8 = icmp eq i32 %6, 63
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  store i32 95, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end7
  store i32 0, ptr %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %if.end10, %if.then9, %if.then6, %if.then, %sw.bb1, %sw.bb
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
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
